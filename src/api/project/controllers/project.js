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
        fields: ["title", "visibility"],
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
    var projects = entries.filter((project) => {
      if (
        project.visibility == "only for me" &&
        project.owner.id == ctx.state.user.id
      )
        return project;
      else if (project.visibility != "only for me") return project;
    });
    return projects;
  },
  async findOne(ctx) {
    var entry = await strapi.entityService.findMany("api::project.project", {
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
          {
            visibility: "all users",
          },
        ],
        id: ctx.request.url.substr(14, 1),
      },
    });
    entry.length == 0
      ? ctx.unauthorized("You are not allowed to view this project details")
      : (entry = entry[0]);
    if (entry.visibility == "only for me" || entry.visibility == "listed only")
      if (entry.owner.id == ctx.state.user.id) return this.getRequests(entry);
      else
        return ctx.unauthorized(
          "You are not allowed to view this project due to visibility option"
        );
    else return this.getRequests(entry);
  },
  async getRequests(entry) {
    const requests = await strapi.entityService.findMany(
      "api::request.request",
      {
        fields: ["approved"],
        filters: {
          approved: false,
        },
        populate: {
          user: { fields: "username" },
          project: { fields: ["title"] },
        },
      }
    );
    entry.requests = requests;
    return entry;
  },
}));
