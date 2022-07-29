module.exports = {
  "0 0 1 * * *": ({ strapi }) => {
    var today = new Date();
    strapi.db.query("api::funding.funding").updateMany({
      where: {
        published: true,
        archived: false,
        plannedEnd: { $lte: today.toISOString().split("T")[0] },
      },
      data: {
        archived: true,
      },
    });
    async function getFundingExpirey() {
      //email if the funding is about to expire in 180 days for admins, in 30 days for users
      var forUsers = new Date();
      var forAdmins = new Date();
      var today = new Date();
      forUsers.setDate(forUsers.getDate() + 180);
      forAdmins.setDate(forAdmins.getDate() + 30);

      const fundingsForUsers = await strapi.entityService.findMany(
        "api::funding.funding",
        {
          fields: ["title", "plannedEnd"],
          filters: {
            plannedEnd: { $eq: forUsers.toISOString().split("T")[0] },
            archived: false,
            published: true,
          },
          populate: {
            projects: {
              fields: ["title"],
              populate: {
                owner: {
                  fields: ["username", "email"],
                  populate: {
                    user_detail: {
                      populate: { notifications: { populate: { email: "*" } } },
                    },
                  },
                },
              },
            },
          },
          sort: { plannedEnd: "ASC" },
        }
      );
      const fundingsForAdmins = await strapi.entityService.findMany(
        "api::funding.funding",
        {
          fields: ["title", "plannedEnd"],
          filters: {
            plannedEnd: { $eq: forAdmins.toISOString().split("T")[0] },
            archived: false,
            published: true,
          },
          sort: { plannedEnd: "ASC" },
        }
      );
      sendToAdmins(fundingsForAdmins);
      sendToUsers(fundingsForUsers);
    }
    async function sendToAdmins(fundings) {
      const users = await strapi.entityService.findMany(
        "plugin::users-permissions.user",
        {
          fields: ["username", "email"],
          populate: {
            role: { fields: ["type"] },
            user_detail: {
              populate: { notifications: { populate: { email: "*" } } },
            },
          },
          filters: {
            role: { type: "admin" },
          },
        }
      );
      for (const funding of fundings) {
        for (const user of users) {
          if (user.user_detail.notifications.email.fundingExpiry == true) {
            await strapi.plugins["email"].services.email.send({
              to: user.email,
              from: process.env.EMAIL_AUTH,
              replyTo: process.env.EMAIL_AUTH,
              subject: `The funding ${funding.title} is about to expire`,
              html: `As an Admin you are being notified that in 30 days the funding "${funding.title}" will expire.`,
            });
          }
        }
      }
    }
    async function sendToUsers(fundings) {
      for (const funding of fundings) {
        for (const project of funding.projects) {
          const user = project.owner;
          if (user.user_detail.notifications.email.fundingExpiry == true) {
            await strapi.plugins["email"].services.email.send({
              to: user.email,
              from: process.env.EMAIL_AUTH,
              replyTo: process.env.EMAIL_AUTH,
              subject: `The funding ${funding.title} is about to expire`,
              html: `As a User you are being notified that in 180 days the funding "${funding.title}" will expire. For your project "${project.title}"`,
            });
          }
        }
      }
    }
    getFundingExpirey();
  },
};
