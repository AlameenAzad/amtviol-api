module.exports = {
  async afterCreate(event) {
    const { params } = event;
    const document = await strapi.entityService.findOne(
      `api::funding.funding`,
      params.data.funding,
      {
        fields: ["title"],
      }
    );
    console.log(document);
    const userRequesting = await strapi
      .controller("api::user-detail.user-detail")
      .find({ state: { user: { id: params.data.owner } } });
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
    for (const user of users) {
      if (user.user_detail.notifications.email.userJoinRequest == true) {
        strapi.plugins["email"].services.email.send({
          to: user.email,
          from: process.env.EMAIL_AUTH,
          replyTo: process.env.EMAIL_AUTH,
          subject: `A new comment added to a funding`,
          html: `${userRequesting.fullName} has added the followign comment to funding: ${document.title} <br /><br /> Comment:<br />${params.data.comment}.`,
        });
      }
    }
  },
};
