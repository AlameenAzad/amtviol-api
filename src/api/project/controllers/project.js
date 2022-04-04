"use strict";

/**
 *  project controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::project.project", ({ strapi }) => ({
  async find(ctx) {
    const entries = await strapi.entityService.findMany(
      "api::project.project",
      {
        fields: ["title"],
        filters: {
          $or: [
            {
              owner: { id: ctx.state.user.id },
            },
            {
              editors: { id: ctx.state.user.id },
            },
            {
              readers: { id: ctx.state.user.id },
            },
          ],
        },
        populate: {
          owner: { fields: ["username"] },
          categories: { fields: ["title"] },
        },
      }
    );
    return entries;
  },
  async findOne(ctx) {
    const entry = await strapi.entityService.findOne(
      "api::project.project",
      ctx.request.url.substr(14, 1),
      {
        populate: {
          owner: { fields: ["username"] },
          editors: { fields: ["username"] },
          readers: { fields: ["username"] },
          categories: { fields: ["title"] },
          tags: { fields: ["title"] },
          info: "*",
          details: "*",
          estimatedCosts: "*",
          links: "*",
          uploads: "*",
          fundingGuideline: "*",
          municipality: "*",
        },
        filters: {
          $or: [
            {
              owner: { id: ctx.state.user.id },
            },
            {
              editors: { id: ctx.state.user.id },
            },
            {
              readers: { id: ctx.state.user.id },
            },
          ],
        },
      }
    );

    return entry;
  },
}));
