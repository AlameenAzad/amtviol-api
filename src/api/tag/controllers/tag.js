"use strict";

/**
 *  tag controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::tag.tag", ({ strapi }) => ({
  async find(ctx) {
    const entries = await strapi.entityService.findMany("api::tag.tag", {
      fields: ["title"],
      populate: { projects: true },
    });
    entries.forEach((entry) => {
      entry.projectsCount = entry.projects.length;
      delete entry.projects;
    });
    return entries;
  },
}));
