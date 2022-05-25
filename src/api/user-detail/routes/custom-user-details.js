module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/user/transfer/:id",
      handler: "user-detail.transferData",
    },
  ],
};
