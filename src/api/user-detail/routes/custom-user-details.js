module.exports = {
  routes: [
    {
      method: "GET",
      path: "/user/transfer/:id",
      handler: "user-detail.transferData",
    },
    {
      method: "GET",
      path: "/user/overview",
      handler: "user-detail.dataOverview",
    },
    {
      method: "GET",
      path: "/user/notification",
      handler: "user-detail.notification",
    },
    {
      method: "GET",
      path: "/stats",
      handler: "user-detail.statsAndArchive",
    },
    {
      method: "GET",
      path: "/public/data",
      handler: "user-detail.publicData",
      config: {
        middlewares: ["plugin::users-permissions.rateLimit"],
      },
    },
    {
      method: "PUT",
      path: "/upload/caption/:id",
      handler: "user-detail.updateFileCaption",
    },
  ],
};
