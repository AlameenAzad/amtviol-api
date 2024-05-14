module.exports = {
  routes: [
    {
      method: "GET",
      path: "/locations/:id",
      handler: "location.findByMunicipality",
    },
  ],
};
