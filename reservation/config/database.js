const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("yourdatabase", "postgres", "postgres", {
  host: "localhost",
  dialect: "postgres",
});

module.exports = sequelize;
