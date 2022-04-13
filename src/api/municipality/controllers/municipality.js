"use strict";

/**
 *  municipality controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::municipality.municipality",
  ({ strapi }) => ({
    async find(ctx) {
      const entries = await strapi.entityService.findMany(
        "api::municipality.municipality",
        {
          fields: ["title", "location"],
          populate: { projects: true, profile: true },
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
