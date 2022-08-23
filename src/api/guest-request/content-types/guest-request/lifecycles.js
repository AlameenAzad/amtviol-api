module.exports = {
  async afterCreate(event) {
    const { params } = event;
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
          from: process.env.DEF_FROM,
          replyTo: process.env.DEF_FROM,
          subject: `Ein neuer Antrag auf Teilnahme an der Plattform`,
          html: `${params.data.email} bittet darum, der Plattform beizutreten.`,
        });
      }
    }
  },
};
