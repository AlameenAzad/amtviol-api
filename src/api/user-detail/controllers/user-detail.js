"use strict";

/**
 *  user-detail controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::user-detail.user-detail",
  ({ strapi }) => ({
    async getEntry(ctx, populate) {
      var params = {
        fields: ["fullName"],
        filters: { user: { id: ctx.state.user.id } },
      };
      if (populate) {
        params.populate = [
          "notifications",
          "notifications.app",
          "notifications.email",
          "municipality",
          "profile",
        ];
        delete params.fields;
      }
      return await strapi.entityService.findMany(
        "api::user-detail.user-detail",
        params
      );
    },
    async create(ctx) {
      //query if logged in user has user-detail
      // var hasEntry = await this.getEntry(ctx, false);
      // if (hasEntry.length > 0) {
      //   return ctx.unauthorized(
      //     `You can't create an entry for this user. User already has an entry.`
      //   );
      // } else {

      // ctx.request.body.data.user = ctx.state.user;
      //init default notifications settings
      ctx.request.body.data.notifications = {
        email: {},
        app: {},
      };
      let entity = await super.create(ctx);
      return entity;
      // }
    },
    async find(ctx) {
      var entry = await this.getEntry(ctx, true);
      return entry.length > 0 ? entry : ctx.badRequest(`User has no entry`);
    },
  })
);
