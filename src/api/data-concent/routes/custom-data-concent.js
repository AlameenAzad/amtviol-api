module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/concent/key",
      handler: "data-concent.generateKey",
      config: {
        middlewares: ["plugin::users-permissions.rateLimit"],
      },
    },
  ],
};
