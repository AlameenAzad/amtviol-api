module.exports = {
  "0 0 1 * * *": ({ strapi }) => {
    var today = new Date();
    strapi.db.query("api::funding.funding").updateMany({
      where: {
        published: true,
        archived: false,
        plannedEnd: { $eq: today.toISOString().split("T")[0] },
      },
      data: {
        archived: true,
      },
    });
  },
};
