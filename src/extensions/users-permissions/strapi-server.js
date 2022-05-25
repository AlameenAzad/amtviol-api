const crypto = require("crypto");
module.exports = (plugin, env) => {
  const sanitizeOutput = (user) => {
    const {
      password,
      resetPasswordToken,
      confirmationToken,
      ...sanitizedUser
    } = user; // be careful, you need to omit other private attributes yourself
    return sanitizedUser;
  };

  plugin.controllers.user.me = async (ctx) => {
    if (!ctx.state.user) {
      return ctx.unauthorized();
    }
    const user = await strapi.entityService.findOne(
      "plugin::users-permissions.user",
      ctx.state.user.id,
      {
        fields: ["username", "email"],
        populate: { role: { fields: ["type"] } },
      }
    );

    ctx.body = sanitizeOutput(user);
  };

  plugin.controllers.user.find = async (ctx) => {
    const users = await strapi.entityService.findMany(
      "plugin::users-permissions.user",
      {
        fields: ["username", "email"],
        populate: {
          role: { fields: ["type"] },
          user_detail: {
            fields: ["fullName"],
            populate: { municipality: { fields: ["title", "location"] } },
          },
        },
      }
    );

    ctx.body = users.map((user) => sanitizeOutput(user));
  };
  plugin.controllers.user.create = async (ctx) => {
    ctx.request.body.password = generatePassword();
    try {
      await strapi.controller("plugin::users-permissions.auth").register(ctx);
      const resetPasswordToken = crypto.randomBytes(64).toString("hex");
      await sendPwdInEmail(ctx, resetPasswordToken);
      var user_detail = await strapi.entityService.create(
        "api::user-detail.user-detail",
        {
          data: {
            invite: true,
            municipality: ctx.request.body.municipality,
            fullName: ctx.request.body.username,
            notifications: {
              email: {},
              app: {},
            },
          },
        }
      );
      var qdata = { resetPasswordToken, user_detail };
      if (ctx.request.body.role == "admin") qdata.role = { id: 4 };
      await strapi.query("plugin::users-permissions.user").update({
        where: { email: ctx.request.body.email },
        data: qdata,
      });
    } catch (error) {
      return ctx.badRequest(error.message, error.details);
    }
  };
  function generatePassword() {
    //generate random secure password at least 8 characters long
    var length = 16,
      charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(_+-=[]{}<>/?",
      retVal = "";
    for (var i = 0, n = charset.length; i < length; ++i) {
      retVal += charset.charAt(Math.floor(Math.random() * n));
    }
    return retVal;
  }
  async function sendPwdInEmail(ctx, resetPasswordToken) {
    await strapi.plugins["email"].services.email.send({
      to: ctx.request.body.email,
      from: process.env.EMAIL_AUTH,
      replyTo: process.env.EMAIL_AUTH,
      subject: "Welcome to Amt-Viol",
      html:
        ctx.request.body.message +
        "<br/><p>" +
        process.env.RESET_PWD_PAGE +
        resetPasswordToken +
        "</p>",
    });
  }
  plugin.controllers.user.update = async (ctx) => {
    // console.log(ctx.state.user);
    const user = await strapi
      .service("plugin::users-permissions.user")
      .edit(ctx.params.id, ctx.request.body.data);
    const payload = ctx;
    payload.state.user.id = ctx.params.id;
    payload.request.body.admin = true;
    // console.log(payload.state.user);
    const userDetail = await strapi
      .controller("api::user-detail.user-detail")
      .getEntry(payload, false);
    const entry = await strapi.db.query("api::user-detail.user-detail").update({
      where: { id: userDetail[0].id },
      data: {
        municipality: ctx.request.body.data.municipality.id,
      },
    });
    return entry;
  };
  return plugin;
};
