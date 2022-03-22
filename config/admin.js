module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '41b0b6415fcf352d80417bfce27d7121'),
  },
});
