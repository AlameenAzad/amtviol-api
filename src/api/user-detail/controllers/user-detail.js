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
      if (ctx.request.body.data.invite) {
        let entity = await super.create(ctx);
        return entity;
      } else {
        return ctx.unauthorized("You can't create an entry for this user.");
      }
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
        const dataAndCount = await this.countAndGetTransferableData(ctx); // for owner transfer
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
        watchlist: {},
        count: {
          projectsCount: 0,
          fundingsCount: 0,
          checklistsCount: 0,
          watchlistCount: 0,
        },
      };
      [dataCount.project, dataCount.count.projectsCount] = await strapi.db
        .query("api::project.project")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      [dataCount.funding, dataCount.count.fundingsCount] = await strapi.db
        .query("api::funding.funding")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      [dataCount.checklist, dataCount.count.checklistsCount] = await strapi.db
        .query("api::checklist.checklist")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      [dataCount.watchlist, dataCount.count.watchlistCount] = await strapi.db
        .query("api::watchlist.watchlist")
        .findWithCount({
          select: ["id"],
          where: {
            owner: ctx.state.user,
          },
        });
      return dataCount;
    },
    async transferDataToUser(ctx, data) {
      ctx.request.query.data = ctx.request.query.data.toLowerCase();
      var dataToTransfer = ctx.request.query.data.split(",");
      //loop through the keys (items to transfer)
      for (var key in data) {
        //ignore the items that werent selected to transfer
        if (!dataToTransfer.includes(key) || key == "count") continue;
        if (key != "watchlist") {
          //transfer reader and editor roles
          await strapi.db.connection.context.raw(
            `UPDATE ${key}s_editors_links SET user_id = ${ctx.params.id} WHERE user_id = ${ctx.state.user.id};`
          );
          await strapi.db.connection.context.raw(
            `UPDATE ${key}s_readers_links SET user_id = ${ctx.params.id} WHERE user_id = ${ctx.state.user.id};`
          );
        }
        //loop through the items to transfer each one of them
        for (var index = 0; index < data[key].length; index++) {
          //have to check each watchlist item to see if the user being transfered to already has one.
          //This is to prevent duplicates
          var item = data[key][index];
          if (key == "watchlist")
            var watchlistExist = await this.checkUserHasWatchlist(ctx, item);
          if (key == "watchlist" && !watchlistExist) continue;
          var res = await strapi.db.query("api::" + key + "." + key).update({
            where: { id: item.id },
            data: {
              owner: {
                id: ctx.params.id,
              },
            },
          });
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
    async checkUserHasWatchlist(ctx, item) {
      const currentWatchlist = await strapi.entityService.findOne(
        "api::watchlist.watchlist",
        item.id,
        {
          fields: ["id"],
          populate: {
            project: {
              fields: ["id"],
            },
            funding: {
              fields: ["id"],
            },
            checklist: {
              fields: ["id"],
            },
          },
        }
      );
      delete currentWatchlist.id;
      currentWatchlist.owner = {
        id: ctx.params.id,
      };
      const entry = await strapi.db.query("api::watchlist.watchlist").findOne({
        where: currentWatchlist,
      });
      return entry == null;
    },
    async dataOverview(ctx) {
      if (ctx.state.user.role.type == "admin")
        return await this.adminOverview(ctx);
      let projects = await strapi.controller("api::project.project").find(ctx);
      let fundings = await strapi.controller("api::funding.funding").find(ctx);
      let checklists = await strapi
        .controller("api::checklist.checklist")
        .find(ctx);

      return { fundings, projects, checklists };
    },
    async adminOverview(ctx) {
      let projects = await strapi.entityService.findMany(
        "api::project.project",
        {
          fields: ["title", "plannedStart", "plannedEnd"],
          populate: {
            owner: { fields: ["username"] },
            categories: { fields: ["title"] },
            editors: { fields: ["username"] },
            readers: { fields: ["username"] },
            tags: { fields: ["title"] },
          },
          filters: {
            archived: false,
            published: true,
          },
        }
      );
      let fundings = await strapi.entityService.findMany(
        "api::funding.funding",
        {
          fields: ["title", "plannedStart", "plannedEnd"],
          populate: {
            owner: { fields: ["username"] },
            categories: { fields: ["title"] },
            editors: { fields: ["username"] },
            readers: { fields: ["username"] },
            tags: { fields: ["title"] },
          },
          filters: {
            archived: false,
            published: true,
          },
        }
      );
      let checklists = await strapi.entityService.findMany(
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
            archived: false,
            published: true,
          },
        }
      );
      return { fundings, projects, checklists };
    },
    async statsAndArchive(ctx) {
      let stats = {
        fundings: await strapi.controller("api::funding.funding").count(),
        archivedFundings: await strapi
          .controller("api::funding.funding")
          .countArchived(),
        projects: await strapi.controller("api::project.project").count(),
        archivedProjects: await strapi
          .controller("api::project.project")
          .countArchived(),
        checklists: await strapi.controller("api::checklist.checklist").count(),
        users: await strapi.db.query("plugin::users-permissions.user").count(),
        watchlists: await strapi.controller("api::watchlist.watchlist").count(),
        municipalities: await strapi
          .controller("api::municipality.municipality")
          .count(),
      };
      let table = {
        projects: await strapi
          .controller("api::project.project")
          .findArchived(),
        fundings: await strapi
          .controller("api::funding.funding")
          .findArchived(),
        checklists: await strapi
          .controller("api::checklist.checklist")
          .findArchived(),
      };
      return { stats, table };
    },
    async notification(ctx) {
      const userDetails = await this.find(ctx);
      const userSettings = userDetails.notifications.app;
      if (userSettings.dataRequests == true)
        var requests = await strapi.entityService.findMany(
          "api::request.request",
          {
            fields: ["approved", "type"],
            filters: {
              approved: false,
              $or: [
                {
                  project: {
                    owner: ctx.state.user.id,
                  },
                },
                {
                  project: {
                    editors: ctx.state.user.id,
                  },
                },
                {
                  funding: {
                    owner: ctx.state.user.id,
                  },
                },
                {
                  funding: {
                    editors: ctx.state.user.id,
                  },
                },
                {
                  checklist: {
                    owner: ctx.state.user.id,
                  },
                },
                {
                  checklist: {
                    editors: ctx.state.user.id,
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
      if (ctx.state.user.role.type == "admin") {
        if (userSettings.userJoinRequest == true)
          var guest = await strapi.entityService.findMany(
            "api::guest-request.guest-request"
          );
        if (userSettings.fundingComments == true)
          var fundingComments = await strapi.entityService.findMany(
            "api::funding-comment.funding-comment",
            {
              fields: ["comment"],
              populate: {
                funding: { fields: ["title"] },
                owner: { fields: ["username"] },
              },
            }
          );
      }
      if (userSettings.fundingExpiry == true)
        var fundingExpirey = await strapi
          .controller("api::funding.funding")
          .getFundingExpirey(ctx);

      return { requests, guest, fundingComments, fundingExpirey };
    },
    //This API is to get specific user-detail of a user. For project ideas and checklists. For the Contact Person information section
    async getContactPersonInfo(ctx, id) {
      const userContactInfo = await strapi.entityService.findOne(
        "api::user-detail.user-detail",
        id,
        {
          fields: ["fullName", "phone", "postalCode", "streetNo"],
          populate: {
            user: { fields: ["email"] },
          },
        }
      );
      userContactInfo.contactName = userContactInfo.fullName;
      delete userContactInfo.fullName;
      userContactInfo.email = userContactInfo.user.email;
      delete userContactInfo.user;
      delete userContactInfo.id;
      return userContactInfo;
    },
    async publicData() {
      var projects = await strapi
        .controller("api::project.project")
        .publicFind();
      var fundings = await strapi
        .controller("api::funding.funding")
        .publicFind();
      var checklists = await strapi
        .controller("api::checklist.checklist")
        .publicFind();
      return { projects, fundings, checklists };
    },
  })
);
