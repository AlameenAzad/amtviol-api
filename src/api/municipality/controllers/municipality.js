"use strict";

/**
 *  municipality controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::municipality.municipality",
  ({ strapi }) => ({
    async find(ctx) {
      const role = ctx.state.user.role.type;
      var filterObj = {
        fields: ["title", "location"],
        populate: {
          projects: {
            fields: ["title"],
            populate: {
              owner: { fields: ["username"] },
              categories: { fields: ["title"] },
            },
          },
          checklists: {
            fields: ["title"],
            populate: {
              owner: { fields: ["username"] },
              categories: { fields: ["title"] },
            },
          },
          user_details: true,
          profile: true,
        },
      };
      if (role != "admin") delete filterObj.populate;
      const entries = await strapi.entityService.findMany(
        "api::municipality.municipality",
        filterObj
      );
      if (role === "admin")
        entries.forEach((entry) => {
          entry.dataSet = {};
          entry.users = "";
          entry.dataSet.projects = entry.projects.length;
          entry.dataSet.checklist = entry.checklists.length;
          entry.dataSet.total =
            entry.dataSet.projects + entry.dataSet.checklist;
          //get users name in a string and remove excess data
          if (entry.user_details.length > 0) {
            entry.user_details.forEach((userDetails) => {
              entry.users += userDetails.fullName + ", ";
            });
            entry.users = entry.users.slice(0, -2);
          }
          //add type = project to all entries in entry.projects
          entry.projects.forEach((project) => {
            project.type = "project";
          });
          //add type = checklist to all entries in entry.checklist
          entry.checklists.forEach((project) => {
            project.type = "Implementation Checklist";
          });
          // delete entry.checklists;
          // delete entry.projects;
          delete entry.user_details;
        });
      return entries;
    },
  })
);
