module.exports = {
  PORT: process.env.PORT || 8000,
  NODE_ENV:  'production',
  DB_URL: 'postgresql://postgres@localhost/spaced-repetition',
  JWT_SECRET: 'secret',
  JWT_EXPIRY: '3h',
};
