"use strict";

/**
 *  category controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::category.category",
  ({ strapi }) => ({
    async find(ctx) {
      const entries = await strapi.entityService.findMany(
        "api::category.category",
        {
          fields: ["title"],
          populate: { projects: true },
        }
      );
      entries.forEach((entry) => {
        entry.projectsCount = entry.projects.length;
        delete entry.projects;
      });
      return entries;
    },
  })
);
