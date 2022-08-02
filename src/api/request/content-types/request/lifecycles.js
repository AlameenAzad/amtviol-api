module.exports = {
  async afterCreate(event) {
    const { params } = event;

    var type = null;
    if (params.data.hasOwnProperty("project")) type = "project";
    else if (params.data.hasOwnProperty("funding")) type = "funding";
    else if (params.data.hasOwnProperty("checklist")) type = "checklist";

    const document = await strapi.entityService.findOne(
      `api::${type}.${type}`,
      params.data[type].id,
      {
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
      }
    );
    if (document.owner.user_detail.notifications.email.dataRequests == true) {
      console.log(document.owner.user_detail.notifications);
      const userRequesting = await strapi
        .controller("api::user-detail.user-detail")
        .find({ state: { user: { id: params.data.user.id } } });
      await strapi.plugins["email"].services.email.send({
        to: document.owner.email,
        from: process.env.EMAIL_AUTH,
        replyTo: process.env.EMAIL_AUTH,
        subject: `Neuer Antrag an ${params.data.type} ${type}: ${document.title}`,
        html: `${userRequesting.fullName} bittet um ${params.data.type} Ihr ${type}: ${document.title} `,
      });
    }
  },
};
