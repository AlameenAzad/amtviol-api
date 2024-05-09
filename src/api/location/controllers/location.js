'use strict';

/**
 * location controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::location.location', ({ strapi }) =>({
  async findByMunicipality(ctx) {
    const { id } = ctx.params;
    const locations = await strapi.entityService.findMany('api::location.location',
      {
        fields: ['title'],
        filters: { municipality: id },
      });
    return locations;
  }
}));
