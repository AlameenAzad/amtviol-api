module.exports = ({ env }) => ({
  // ...
  email: {
    config: {
      provider: "nodemailer",
      providerOptions: {
        host: env("SMTP_HOST", "smtp.ionos.de"),
        port: env("SMTP_PORT", 587),
        auth: {
          user: env("EMAIL_AUTH"),
          pass: env("EMAIL_PASS"),
        },
        // ... any custom nodemailer options
      },
      settings: {
        defaultFrom: env("DEF_FROM", "Alameen.Azad@kruscheCompany.com"),
        defaultReplyTo: env("DEF_REPLYTO", "Alameen.Azad@kruscheCompany.com"),
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
      ],
    },
  },
});
