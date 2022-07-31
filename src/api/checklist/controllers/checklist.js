"use strict";

/**
 *  checklist controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::checklist.checklist",
  ({ strapi }) => ({
    async create(ctx) {
      ctx.request.body.data.owner = ctx.state.user;
      let entity = await super.create(ctx);
      return entity;
    },
    async find(ctx) {
      const entries = await strapi.entityService.findMany(
        "api::checklist.checklist",
        {
          fields: ["title", "visibility", "published", "ideaProvider"],
          populate: {
            owner: { fields: ["username"] },
            categories: { fields: ["title"] },
            tags: { fields: ["title"] },
            editors: { fields: ["username"] },
            readers: { fields: ["username"] },
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
      var entry = await strapi.entityService.findMany(
        "api::checklist.checklist",
        {
          populate: {
            owner: { fields: ["username"] },
            editors: { fields: ["username"] },
            readers: { fields: ["username"] },
            categories: { fields: ["title"] },
            media: "*",
            tags: { fields: ["title"] },
            info: "*",
            fundings: { fields: ["title"] },
            municipality: { fields: ["title", "location"] },
            project: { fields: ["title"] },
            initialContact: {
              populate: {
                captureIdea: { populate: "*" },
                caputreContect: { populate: "*" },
              },
            },
            preparation: {
              populate: {
                inspection: { populate: "*" },
                captureRequirements: { populate: "*" },
                captureNeeds: { populate: "*" },
              },
            },
            fundingResearch: {
              populate: {
                checkDatabase: { populate: "*" },
                checkForFunding: { populate: "*" },
                checkWithFunding: { populate: "*" },
                checkGuildlines: { populate: "*" },
              },
            },
            preparationOfProject: {
              populate: {
                checkContent: { populate: "*" },
                checkCooperations: { populate: "*" },
                checkSimilarProejcts: { populate: "*" },
                checkPlanning: { populate: "*" },
              },
            },
            legitimation: {
              populate: {
                template: { populate: "*" },
              },
            },
            finalExamination: {
              populate: {
                revision: { populate: "*" },
                signatures: { populate: "*" },
              },
            },
          },
          filters,
        }
      );
      if (entry.length == 0)
        return ctx.unauthorized(
          "Sie sind nicht berechtigt, die Details dieser Checkliste anzuzeigen"
        );
      entry = entry[0];
      var contactInfo = await strapi
        .controller("api::user-detail.user-detail")
        .getContactPersonInfo(ctx, entry.owner.id);
      contactInfo.location = entry.info.location;
      entry.info = contactInfo;
      if (entry.owner.id == ctx.state.user.id) return this.getRequests(entry);
      else return entry;
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
      var entry = await strapi.entityService.findMany(
        "api::checklist.checklist",
        {
          populate: {
            owner: { fields: ["username"] },
          },
          filters,
        }
      );
      if (entry.length == 0)
        return ctx.unauthorized(
          "Sie sind nicht berechtigt, diese Checklistendetails zu bearbeiten"
        );
      else return await super.update(ctx);
    },
    async delete(ctx) {
      if (ctx.state.user.role.type == "admin") return await super.delete(ctx);
      var entry = await strapi.entityService.findMany(
        "api::checklist.checklist",
        {
          populate: {
            owner: { fields: ["username"] },
          },
          filters: {
            owner: { id: ctx.state.user.id },
            id: ctx.params.id,
          },
        }
      );
      if (entry.length == 0)
        return ctx.unauthorized("Sie dürfen diese Checkliste nicht löschen");
      else return await super.delete(ctx);
    },
    async getRequests(entry) {
      const requests = await strapi.entityService.findMany(
        "api::request.request",
        {
          fields: ["approved"],
          filters: {
            approved: false,
            checklist: { id: entry.id },
          },
          populate: {
            user: { fields: "username" },
            checklist: { fields: ["title"] },
          },
        }
      );
      entry.requests = requests;
      return entry;
    },
    async count() {
      return await strapi.db.query("api::checklist.checklist").count({
        where: {
          archived: false,
        },
      });
    },
    async findArchived() {
      const entries = await strapi.entityService.findMany(
        "api::checklist.checklist",
        {
          fields: ["title"],
          populate: {
            owner: { fields: ["username"] },
            categories: { fields: ["title"] },
            editors: { fields: ["username"] },
            readers: { fields: ["username"] },
            tags: { fields: ["title"] },
          },
          filters: {
            archived: true,
          },
        }
      );
      return entries;
    },
    async publicFind() {
      const entries = await strapi.entityService.findMany(
        "api::checklist.checklist",
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
  })
);
