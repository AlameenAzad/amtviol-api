"use strict";

/**
 *  request controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::request.request", ({ strapi }) => ({
  async create(ctx) {
    const exists = await strapi.entityService.findMany("api::request.request", {
      filters: {
        ...ctx.request.body.data,
      },
    });
    if (exists.length > 0) {
      ctx.throw(
        400,
        `Request to ${ctx.request.body.data.type} this document already exists.`
      );
    } else return await super.create(ctx);
  },
  async update(ctx) {
    const request = await strapi.entityService.findMany(
      "api::request.request",
      {
        fields: ["approved", "type"],
        filters: {
          approved: false,
          id: ctx.params.id,
          $or: [
            {
              project: {
                owner: ctx.state.user.id,
              },
            },
            {
              funding: {
                owner: ctx.state.user.id,
              },
            },
            {
              checklist: {
                owner: ctx.state.user.id,
              },
            },
          ],
        },
        populate: {
          user: { fields: "username" },
          funding: { fields: ["title"] },
          project: { fields: ["title"] },
          checklist: { fields: ["title"] },
        },
      }
    );
    // return request;
    if (request.length > 0) {
      if (request[0].funding != null) this.acceptFunding(request[0]);
      else if (request[0].project != null) this.acceptProject(request[0]);
      else if (request[0].checklist != null) this.acceptChecklist(request[0]);
      const response = await super.update(ctx);
      return response;
    } else
      return ctx.unauthorized(`You are not authorized to accept this request.`);
  },
  async acceptFunding(request) {
    if (request.type == "edit")
      await strapi.db.connection.context.raw(
        `INSERT INTO fundings_editors_links VALUES (${request.funding.id}, ${request.user.id});`
      );
    else if (request.type == "view")
      await strapi.db.connection.context.raw(
        `INSERT INTO fundings_readers_links VALUES (${request.funding.id}, ${request.user.id});`
      );
  },
  async acceptProject(request) {
    if (request.type == "edit")
      await strapi.db.connection.context.raw(
        `INSERT INTO projects_editors_links VALUES (${request.project.id}, ${request.user.id});`
      );
    else if (request.type == "view")
      await strapi.db.connection.context.raw(
        `INSERT INTO projects_readers_links VALUES (${request.project.id}, ${request.user.id});`
      );
  },
  async acceptChecklist(request) {
    if (request.type == "edit")
      await strapi.db.connection.context.raw(
        `INSERT INTO checklists_editors_links VALUES (${request.checklist.id}, ${request.user.id});`
      );
    else if (request.type == "view")
      await strapi.db.connection.context.raw(
        `INSERT INTO checklists_readers_links VALUES (${request.checklist.id}, ${request.user.id});`
      );
  },
}));
