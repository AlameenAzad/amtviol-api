'use strict';

/**
 * guest-request router.
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::guest-request.guest-request');