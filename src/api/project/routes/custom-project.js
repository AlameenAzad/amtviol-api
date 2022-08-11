module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "POST",
      path: "/project/duplicate/:id",
      handler: "project.duplicateProjectDirectly",
    },
  ],
};
