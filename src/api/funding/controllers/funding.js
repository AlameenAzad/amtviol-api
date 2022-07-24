"use strict";

/**
 *  funding controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::funding.funding", ({ strapi }) => ({
  async find(ctx) {
    const entries = await strapi.entityService.findMany(
      "api::funding.funding",
      {
        fields: [
          "title",
          "visibility",
          "published",
          "plannedStart",
          "plannedEnd",
        ],
        populate: {
          owner: { fields: ["username"] },
          categories: { fields: ["title"] },
          editors: { fields: ["username"] },
          readers: { fields: ["username"] },
          tags: { fields: ["title"] },
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
      }
    );
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
    var entry = await strapi.entityService.findMany("api::funding.funding", {
      populate: {
        owner: { fields: ["username"] },
        editors: { fields: ["username"] },
        readers: { fields: ["username"] },
        categories: { fields: ["title"] },
        tags: { fields: ["title"] },
        info: "*",
        details: "*",
        rates: "*",
        links: "*",
        media: "*",
        files: "*",
        fundings: { fields: ["title"] },
        municipality: { fields: ["title", "location"] },
        fundingsLinkedTo: { fields: ["title"] },
        checklist: { fields: ["title"] },
        projects: { fields: ["title"] },
        projects: { fields: ["title"] },
        funding_comments: {
          fileds: ["comment"],
          populate: { owner: { fields: ["username"] } },
        },
      },
      filters,
    });
    if (entry.length == 0)
      return ctx.unauthorized(
        "You are not allowed to view this funding details"
      );
    entry = entry[0];
    if (entry.owner.id == ctx.state.user.id) return this.getRequests(entry);
    else return entry;
  },
  async create(ctx) {
    ctx.request.body.data.owner = ctx.state.user;
    if (ctx.request.body.data.hasOwnProperty("checklist")) {
      const checkChecklist = await this.checkChecklist(
        ctx.request.body.data.checklist.id
      );
      if (checkChecklist == null || checkChecklist.funding != null)
        return ctx.badRequest(
          "The checklist you have selected already has a funding linked to it."
        );
    }
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
    var entry = await strapi.entityService.findMany("api::funding.funding", {
      populate: {
        owner: { fields: ["username"] },
      },
      filters,
    });
    if (entry.length == 0)
      return ctx.unauthorized(
        "You are not allowed to edit this funding details"
      );
    else return await super.update(ctx);
  },
  async delete(ctx) {
    var entry = await strapi.entityService.findMany("api::funding.funding", {
      populate: {
        owner: { fields: ["username"] },
      },
      filters: {
        owner: { id: ctx.state.user.id },
        id: ctx.params.id,
      },
    });
    if (entry.length == 0)
      return ctx.unauthorized("You are not allowed to delete this funding");
    else return await super.delete(ctx);
  },
  async getRequests(entry) {
    const requests = await strapi.entityService.findMany(
      "api::request.request",
      {
        fields: ["approved"],
        filters: {
          approved: false,
          funding: { id: entry.id },
        },
        populate: {
          user: { fields: "username" },
          funding: { fields: ["title"] },
        },
      }
    );
    entry.requests = requests;
    return entry;
  },
  async checkChecklist(id) {
    const checklist = await strapi.entityService.findOne(
      "api::checklist.checklist",
      id,
      { populate: { funding: true } }
    );
    return checklist;
  },
  async count() {
    return await strapi.db.query("api::funding.funding").count({
      where: {
        archived: false,
      },
    });
  },
  async countArchived() {
    return await strapi.db.query("api::funding.funding").count({
      where: {
        archived: true,
      },
    });
  },
  async findArchived() {
    const entries = await strapi.entityService.findMany(
      "api::funding.funding",
      {
        fields: ["title", "plannedStart", "plannedEnd"],
        populate: {
          owner: { fields: ["username"] },
          categories: { fields: ["title"] },
        },
        filters: {
          archived: true,
        },
      }
    );
    return entries;
  },
  async getFundingExpirey(ctx) {
    var forUsers = new Date();
    var forAdmins = new Date();
    var today = new Date();
    forUsers.setDate(forUsers.getDate() + 180);
    forAdmins.setDate(forAdmins.getDate() + 30);

    var filters = {
      $and: [
        { plannedEnd: { $lte: forUsers.toISOString().split("T")[0] } },
        { plannedEnd: { $gte: today.toISOString().split("T")[0] } },
        { archived: false },
        {
          projects: {
            owner: { id: ctx.state.user.id },
          },
        },
      ],
    };
    if (ctx.state.user.role.type == "admin") {
      filters.$and[0].plannedEnd = {
        $lte: forAdmins.toISOString().split("T")[0],
      };
      filters.$and.pop();
    }
    const entries = await strapi.entityService.findMany(
      "api::funding.funding",
      {
        fields: ["title", "plannedEnd"],
        filters,
        sort: { plannedEnd: "ASC" },
      }
    );
    return entries;
  },
}));
