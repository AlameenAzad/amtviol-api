'use strict';

/**
 * emailing-center controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::emailing-center.emailing-center',
  ({ strapi }) => ({
    async create(ctx) {
      let created = await super.create(ctx);
      const { group, subject, body } = JSON.parse(ctx.request.body.data);

      const users = await strapi.entityService.findMany('plugin::users-permissions.user', {
        fields: ['email'],
        filters: {
          role: {
            id: Number(group),
          },
        },
      });

      const emails = await users.map(user => user.email);

      const attachments = await ctx.request.files['files.attachments'].map(attachment => ({
        path: attachment.path,
        filename: attachment.name,
      }));

      const response = await strapi.plugins['email'].services.email.send({
        from: process.env.DEF_FROM,
        bcc: emails,
        replyTo: 'foerderscouting-plattform@amt-vioel.de',
        subject: subject,
        html: body,
        attachments,
      });

      if (response.rejected.length > 0) {
        created = strapi.entityService.update('api::emailing-center.emailing-center', created.data.id, {
          data: {
          status: false,
          response: response
        }
        });
        return {
          message: 'Email could not be sent to all recipients',
          response
        };
      }
      created = strapi.entityService.update('api::emailing-center.emailing-center', created.data.id, {
        data: {
          status: true,
          response: response
        }
        });

      return created;
    }
  })
);
