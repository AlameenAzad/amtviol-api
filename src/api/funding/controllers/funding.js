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
          ],
        },
      }
    );
    return entries;
  },
  async findOne(ctx) {
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
      },
      filters: {
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
        ],
        id: ctx.params.id,
      },
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
    console.log(ctx.request.body.data);
    ctx.request.body.data.owner = ctx.state.user;
    let entity = await super.create(ctx);
    return entity;
  },
  async update(ctx) {
    delete ctx.request.body.data.owner;
    var entry = await strapi.entityService.findMany("api::funding.funding", {
      populate: {
        owner: { fields: ["username"] },
      },
      filters: {
        $or: [
          {
            owner: { id: ctx.state.user.id },
          },
          {
            editors: { id: ctx.state.user.id },
          },
        ],
        id: ctx.params.id,
      },
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
}));
