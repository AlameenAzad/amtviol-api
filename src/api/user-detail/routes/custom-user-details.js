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
      path: "/stats",
      handler: "user-detail.statsAndArchive",
    },
  ],
};
