module.exports = ({ env }) => ({
  // ...
  email: {
    config: {
      provider: "nodemailer",
      providerOptions: {
        host: env("SMTP_HOST", "smtp.gmail.com"),
        port: env("SMTP_PORT", 587),
        auth: {
          user: env("EMAIL_AUTH", "areenaram19@gmail.com"),
          pass: env("EMAIL_PASS", "zuelniwlwzpovnbe"),
        },
        // ... any custom nodemailer options
      },
      settings: {
        defaultFrom: env("DEF_FROM", "areenaram19@gmail.com"),
        defaultReplyTo: env("DEF_REPLYTO", "areenaram19@gmail.com"),
      },
    },
  },
  transformer: {
    enabled: true,
    config: {
      prefix: "/api/",
    },
  },
  "config-sync": {
    enabled: true,
    config: {
      syncDir: "config/sync/",
      minify: true,
      excludedConfig: [
        "core-store.plugin_users-permissions_grant",
        "core-store.plugin_users-permissions_email",
        "core-store.plugin_users-permissions_advanced",
      ],
    },
  },
  sentry: {
    enabled: env("NODE_ENV") === "production",
    config: {
      dsn: env("SENTRY_DSN"),
      sendMetadata: true,
    },
  },
});
