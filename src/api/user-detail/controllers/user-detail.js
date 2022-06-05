"use strict";

/**
 *  user-detail controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::user-detail.user-detail",
  ({ strapi }) => ({
    async getEntry(ctx, populate) {
      var params = {
        fields: ["fullName"],
        filters: { user: { id: ctx.state.user.id } },
      };
      if (populate) {
        params.populate = [
          "notifications",
          "notifications.app",
          "notifications.email",
          "municipality",
          "profile",
        ];
        delete params.fields;
      }
      return await strapi.entityService.findMany(
        "api::user-detail.user-detail",
        params
      );
    },
    async create(ctx) {
      //query if logged in user has user-detail
      // var hasEntry = await this.getEntry(ctx, false);
      // if (hasEntry.length > 0) {
      //   return ctx.unauthorized(
      //     `You can't create an entry for this user. User already has an entry.`
      //   );
      // } else {

      // ctx.request.body.data.user = ctx.state.user;
      //init default notifications settings
      // ctx.request.body.data.notifications = {
      //   email: {},
      //   app: {},
      // };
      if (ctx.request.body.data.invite) {
        let entity = await super.create(ctx);
        return entity;
      } else {
        return ctx.unauthorized("You can't create an entry for this user.");
      }
      // }
    },
    async update(ctx) {
      var hasEntry = await this.getEntry(ctx, false);
      if (hasEntry.length > 0) {
        delete ctx.request.body.data.municipality;
        let entity = await super.update(ctx);
        return entity;
      } else {
        return ctx.unauthorized("You can't update this entry for this user.");
      }
    },
    async find(ctx) {
      var entry = await this.getEntry(ctx, true);
      return entry.length > 0 ? entry[0] : ctx.badRequest(`User has no entry`);
    },
    async transferData(ctx) {
      const user = await this.checkUserAvailable(ctx.params.id);
      if (ctx.state.user.id != ctx.params.id || user == null) {
        const dataAndCount = await this.countAndGetTransferableData(ctx);
        await this.transferDataToUser(ctx, dataAndCount);
        return dataAndCount;
      } else {
        return ctx.unauthorized(
          "You can't transfer data to yourself. And/Or user you are transferring to doesn't exist."
        );
      }
    },
    async countAndGetTransferableData(ctx) {
      var dataCount = {
        project: {},
        funding: {},
        checklist: {},
        projectsCount: 0,
        fundingsCount: 0,
        checklistsCount: 0,
      };
      [dataCount.project, dataCount.projectsCount] = await strapi.db
        .query("api::project.project")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      [dataCount.funding, dataCount.fundingsCount] = await strapi.db
        .query("api::funding.funding")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      [dataCount.checklist, dataCount.checklistsCount] = await strapi.db
        .query("api::checklist.checklist")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      return dataCount;
    },
    async transferDataToUser(ctx, data) {
      delete data.projectsCount;
      delete data.fundingsCount;
      delete data.checklistsCount;
      console.log(data);
      for (var key in data) {
        console.log(data[key]);
        for (var index = 0; index < data[key].length; index++) {
          var item = data[key][index];
          console.log(item);
          var res = await strapi.db.query("api::" + key + "." + key).update({
            where: { id: item.id },
            data: {
              owner: {
                id: ctx.params.id,
              },
            },
          });
          console.log(res);
        }
      }
    },
    async checkUserAvailable(id) {
      const user = await strapi.entityService.findOne(
        "plugin::users-permissions.user",
        99,
        {
          fields: ["username"],
        }
      );

      return user;
    },
  })
);
