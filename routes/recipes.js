var express = require('express');
var router = express.Router();
var passport = require("passport");
var passportJWT = require("passport-jwt");
require('../config/config')

var ExtractJwt = passportJWT.ExtractJwt;
var JwtStrategy = passportJWT.Strategy;
const jwtOptions = {}
jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme("jwt");
jwtOptions.secretOrKey = CONFIG.jwt_encryption;

var strategy = new JwtStrategy(jwtOptions, function(jwt_payload, next) {
   console.log('payload received', jwt_payload);

   connection.query('SELECT * from users WHERE id="' + jwt_payload.id + '"', function (error, user, fields) {
      if(error || user.length === 0){
         next(null, false);
      } else {
         if (user.length === 1) {
            next(null, user[0]);
         }

      }
   });
});

passport.use(strategy);

/* GET recipes listing. */
router.get('/', passport.authenticate('jwt', { session: false }), function(req, res, next) {
   connection.query('SELECT * from recipes', function (error, results, fields) {
      if(error){
         res.send(JSON.stringify({"status": 500, "error": error, "response": null}));
         //If there is error, we send the error in the error section with 500 status
      } else {
         res.send({"status": 200, "error": null, "response": results});
         //If there is no error, all is good and response is 200OK.
      }

   });
});

module.exports = router;
