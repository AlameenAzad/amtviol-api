module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/user/transfer/:id",
      handler: "user-detail.transferData",
    },
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/user/overview",
      handler: "user-detail.dataOverview",
    },
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/user/notification",
      handler: "user-detail.notification",
    },
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/stats",
      handler: "user-detail.statsAndArchive",
    },
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/public/data",
      handler: "user-detail.publicData",
    },
    {
      // Path defined with a URL parameter
      method: "PUT",
      path: "/upload/caption/:id",
      handler: "user-detail.updateFileCaption",
    },
  ],
};
