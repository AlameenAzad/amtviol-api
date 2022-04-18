"use strict";

/**
 *  request controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::request.request", ({ strapi }) => ({
  async update(ctx) {
    const projectOwner = await strapi.entityService.findOne(
      "api::request.request",
      ctx.params.id,
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
    if (projectOwner.project.owner.id == ctx.state.user.id) {
      const response = await super.update(ctx);
      return response;
    } else
      return ctx.unauthorized(
        `You are not authorized to edit this invitation.`
      );
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
