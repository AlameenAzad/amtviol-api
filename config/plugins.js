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
        defaultFrom: "Alameen.Azad@kruscheCompany.com",
        defaultReplyTo: "Alameen.Azad@kruscheCompany.com",
      },
    },
  },
  transformer: {
    enabled: true,
    config: {
      prefix: "/api/",
    },
  },
});
