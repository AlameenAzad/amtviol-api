"use strict";

/**
 *  data-concent controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::data-concent.data-concent",
  ({ strapi }) => ({
    async findOne(ctx) {
      return await strapi.entityService.findMany(
        "api::data-concent.data-concent",
        {
          filters: {
            cKey: ctx.request.params.id,
          },
        }
      );
    },
    async update(ctx) {
      const body = ctx.request.body.data;
      if (body.hasOwnProperty("key")) {
        const key = await strapi.entityService.findMany(
          "api::data-concent.data-concent",
          {
            filters: {
              cKey: body.key,
            },
          }
        );
        if (key) {
          return await strapi.entityService.update(
            "api::data-concent.data-concent",
            key[0].id,
            { data: body }
          );
        } else {
          return ctx.badRequest("Sie haben keine Erlaubnis.");
        }
      } else {
        return ctx.badRequest("Sie haben keine Erlaubnis.");
      }
    },
    async generateKey(ctx) {
      const bcrypt = require("bcryptjs");
      var key = await this.generateRandomKey(30);
      key += ctx.request.headers["user-agent"];
      const hashedKey = await bcrypt.hash(key, 10);
      ctx.request.body.data = {
        cKey: hashedKey,
      };
      await super.create(ctx);
      return { key: hashedKey };
    },
    async generateRandomKey(length) {
      const chars =
        "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
      const randomArray = Array.from(
        { length },
        (v, k) => chars[Math.floor(Math.random() * chars.length)]
      );

      const randomString = randomArray.join("");
      return randomString;
    },
  })
);
