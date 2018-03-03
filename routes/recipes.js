var express = require('express');
var router = express.Router();
var passport = require('passport');
var passportJWT = require('passport-jwt');
var fs = require('fs');
require('../config/config');

var ExtractJwt = passportJWT.ExtractJwt;
var JwtStrategy = passportJWT.Strategy;
const jwtOptions = {}
jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme("jwt");
jwtOptions.secretOrKey = CONFIG.jwt_encryption;

var strategy = new JwtStrategy(jwtOptions, function (jwt_payload, next) {
   // console.log('payload received', jwt_payload);

   connection.query('SELECT * from users WHERE id="' + jwt_payload.id + '"', function (error, user, fields) {
      if (error || user.length === 0) {
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
router.get('/', passport.authenticate('jwt', {session: false}), function (req, res, next) {
   connection.query('SELECT * from recipes', function (error, results, fields) {
      if (error) {
         res.send(JSON.stringify({"status": 500, "error": error, "response": null}));
         //If there is error, we send the error in the error section with 500 status
      } else {
         res.send({"status": 200, "error": null, "response": results});
         //If there is no error, all is good and response is 200OK.
      }

   });
});

/* GET recipes listing. */
router.post('/', passport.authenticate('jwt', {session: false}), function (req, res, next) {

   if (!req.body.title || !req.body.ingredients || !req.body.preparation || !req.body.portion) {
      res.send({"status": 500, "error": null, "response": {message: 'incomplete request'}});
      return;
   }

   const title = req.body.title,
       ingredients = req.body.ingredients,
       preparation = req.body.preparation,
       portion = parseInt(req.body.portion);

   if (!req.files) {
      const sql = "INSERT INTO `recipes`(`title`,`ingredients`,`preparation`, `portion`)"
                  + "VALUES ('" + title + "','"
                  + ingredients + "','" + preparation + "','" + portion + "')";

      connection.query(sql, function (err, result) {
         if (err) {
            res.send({"status": 500, "error": err, "response": null});
         } else {
            res.send({"status": 200, "error": null, "response": result});
         }
      });
   } else {
      const file = req.files.image;
      if (file.mimetype === "image/jpeg" || file.mimetype === "image/png" || file.mimetype === "image/gif") {
         const image_path = 'public/images/uploads/' + file.name;

         file.mv(image_path, function (err) {
            if (err) {
               res.send({"status": 500, "error": err, "message": 'this error'});
            } else {
               const sql = "INSERT INTO `recipes`(`title`,`image_path`,`ingredients`,`preparation`, `portion`)"
                           + "VALUES ('" + title + "','"
                           + image_path + "','" + ingredients + "','" + preparation + "','" + portion + "')";

               connection.query(sql, function (err, result) {
                  if (err) {
                     res.send({"status": 500, "error": err, "response": null});
                  } else {
                     res.send({"status": 200, "error": null, "response": result});
                  }
               });
            }
         });
      } else {
         const message = "This format is not allowed , please upload file with '.png','.gif','.jpg'";
         res.send(JSON.stringify({"status": 400, "error": error, "response": {message: message}}));
      }
   }
});

module.exports = router;
