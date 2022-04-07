"use strict";

/**
 *  request controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::request.request", ({ strapi }) => ({
  async update(ctx) {
    // some logic here
    const projectOwner = await strapi.entityService.findOne(
      "api::request.request",
      ctx.request.url.substr(14, 1),
      {
        fields: ["approved"],
        populate: {
          user: { fields: ["username"] },
          project: {
            fields: ["title"],
            populate: { owner: { fields: ["username"] } },
          },
        },
      }
    );
    //TODO: the follwoing code is not working
    // Allow to update only if the user is the owner of the project
    // check the roles permission in settings we may have given to more than one roles
    console.log(ctx.state.user.id);
    return projectOwner;
    // if (projectOwner.project.owner.id == ctx.state.user.id) {
    //   const response = await super.update(ctx);
    //   // some more logic

    //   return response;
    // } else
    //   return ctx.unauthorized(
    //     `You are not authorized to accept this invitation.`
    //   );
  },
  async find(ctx) {
    const entries = await strapi.entityService.findMany(
      "api::request.request",
      {
        fields: ["approved"],
        populate: {
          user: { fields: ["username"] },
          project: {
            fields: ["title"],
            populate: { owner: { fields: ["username"] } },
          },
        },
      }
    );
    return entries;
  },
}));
