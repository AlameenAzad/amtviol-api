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
        fields: [
          "title",
          "visibility",
          "published",
          "plannedStart",
          "plannedEnd",
        ],
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
              visibility: "listed only",
            },
            {
              visibility: "all users",
            },
          ],
          $and: [
            {
              $or: [
                {
                  published: true,
                },
                {
                  $and: [
                    {
                      published: false,
                    },
                    {
                      owner: { id: ctx.state.user.id },
                    },
                  ],
                },
              ],
            },
            {
              archived: false,
            },
          ],
        },
        populate: {
          owner: { fields: ["username"] },
          categories: { fields: ["title"] },
          editors: { fields: ["username"] },
          readers: { fields: ["username"] },
          tags: { fields: ["title"] },
        },
      }
    );
    // Used to be for prioritizing visibility over roles
    // var projects = entries.filter((project) => {
    //   if (
    //     project.visibility == "only for me" &&
    //     project.owner.id == ctx.state.user.id
    //   )
    //     return project;
    //   else if (project.visibility != "only for me") return project;
    // });
    return entries;
  },
  async findOne(ctx) {
    let filters = {
      // (owner == user|| editors == user || readers == user || visibility == "all users") && (published == true || published == false && owner==user)
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
      $and: [
        {
          $or: [
            {
              published: true,
            },
            {
              $and: [
                {
                  published: false,
                },
                {
                  owner: { id: ctx.state.user.id },
                },
              ],
            },
          ],
        },
        {
          archived: false,
        },
      ],
      id: ctx.params.id,
    };
    if (ctx.state.user.role.type == "admin") {
      delete filters.$or;
      delete filters.$and;
    }
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
        media: "*",
        files: "*",
        fundingGuideline: { fields: ["title"] },
        municipality: { fields: ["title", "location"] },
      },
      filters,
    });
    if (entry.length == 0)
      return ctx.unauthorized(
        "You are not allowed to view this project details"
      );

    entry = entry[0];
    var contactInfo = await strapi
      .controller("api::user-detail.user-detail")
      .getContactPersonInfo(ctx, entry.owner.id);
    contactInfo.location = entry.info.location;
    entry.info = contactInfo;
    // if (entry.visibility == "only for me" || entry.visibility == "listed only")
    if (entry.owner.id == ctx.state.user.id) return this.getRequests(entry);
    // else
    //   return ctx.unauthorized(
    //     "You are not allowed to view this project due to visibility option"
    //   );
    else return entry;
  },
  async create(ctx) {
    ctx.request.body.data.owner = ctx.state.user;
    let entity = await super.create(ctx);
    return entity;
  },
  async update(ctx) {
    delete ctx.request.body.data.owner;
    let filters = {
      $or: [
        {
          owner: { id: ctx.state.user.id },
        },
        {
          editors: { id: ctx.state.user.id },
        },
      ],
      id: ctx.params.id,
    };
    if (ctx.state.user.role.type == "admin") delete filters.$or;
    var entry = await strapi.entityService.findMany("api::project.project", {
      populate: {
        owner: { fields: ["username"] },
      },
      filters,
    });
    if (entry.length == 0)
      return ctx.unauthorized(
        "You are not allowed to edit this project details"
      );
    else return await super.update(ctx);
  },
  async delete(ctx) {
    var entry = await strapi.entityService.findMany("api::project.project", {
      populate: {
        owner: { fields: ["username"] },
      },
      filters: {
        owner: { id: ctx.state.user.id },
        id: ctx.params.id,
      },
    });
    if (entry.length == 0)
      return ctx.unauthorized("You are not allowed to delete this project");
    else return await super.delete(ctx);
  },
  async getRequests(entry) {
    const requests = await strapi.entityService.findMany(
      "api::request.request",
      {
        fields: ["approved"],
        filters: {
          approved: false,
          project: { id: entry.id },
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
  async count() {
    return await strapi.db.query("api::project.project").count({
      where: {
        archived: false,
      },
    });
  },
  async countArchived() {
    return await strapi.db.query("api::project.project").count({
      where: {
        archived: true,
      },
    });
  },
  async findArchived() {
    const entries = await strapi.entityService.findMany(
      "api::project.project",
      {
        fields: ["title", "plannedStart", "plannedEnd"],
        filters: {
          archived: true,
        },
        populate: {
          owner: { fields: ["username"] },
          categories: { fields: ["title"] },
          editors: { fields: ["username"] },
          readers: { fields: ["username"] },
          tags: { fields: ["title"] },
        },
      }
    );
    return entries;
  },
  async publicFind() {
    const entries = await strapi.entityService.findMany(
      "api::project.project",
      {
        fields: ["title"],
        filters: {
          $or: [
            {
              visibility: "all users",
            },
            {
              visibility: "listed only",
            },
          ],
          published: true,
          archived: false,
        },
        populate: {
          categories: { fields: ["title"] },
        },
      }
    );
    return entries;
  },
}));
