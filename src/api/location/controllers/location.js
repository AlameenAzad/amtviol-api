'use strict';

/**
 * location controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::location.location', ({ strapi }) =>({
  async findByMunicipality(ctx) {
    console.log("🚀 ~ findByMunicipality ~ ctx:", ctx.state)
    const isAdmin = ctx.state.user.role.type === 'admin';
    const { id } = ctx.params;
    const filters = {
      fields: ['title'],
    };
    if (!isAdmin) {
      filters.filters = {
        municipality: id,
      };
    }
    const locations = await strapi.entityService.findMany('api::location.location',
      filters);
    return locations;
  }
}));
