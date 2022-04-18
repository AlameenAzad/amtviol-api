module.exports = ({ env }) => ({
  auth: {
    secret: env("ADMIN_JWT_SECRET", "41b0b6415fcf352d80417bfce27d7121"),
  },
  apiToken: {
    salt: env("API_TOKEN_SALT", "1dc8a1bbad00ab8215dbd1df112b7ad4"),
  },
  watchIgnoreFiles: ["**/config/sync/**"],
});
