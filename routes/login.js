var express = require('express');
var router = express.Router();
var _ = require('lodash');
var jwt = require('jsonwebtoken');
var crypto = require('crypto');
require('../config/config');

var passportJWT = require("passport-jwt");

var ExtractJwt = passportJWT.ExtractJwt;
var JwtStrategy = passportJWT.Strategy;

const jwtOptions = {}
jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme("jwt");
jwtOptions.secretOrKey = CONFIG.jwt_encryption;

router.post('/', function (req, res) {
   if (req.body.name && req.body.password) {
      const name = req.body.name;
      const password = req.body.password;

      connection.query('SELECT * from users WHERE username="' + name + '"', function (error, results, fields) {
         if(error || results.length === 0){
            res.status(401).json({message: "no such user found"});
         } else {
            const hash = crypto.createHmac('sha512', CONFIG.hash);
            hash.update(password);
            if (results.length === 1 && results[0].password === hash.digest('hex')) {
               const user = results[0];
               const payload = {id: user.id};
               const token = jwt.sign(payload, jwtOptions.secretOrKey);
               res.json({message: "ok", token: token});
            } else {
               res.status(401).json({message: 'passwords did not match'});
            }
         }
      });
   } else {
      res.status(401).json({message: 'enter data to login'});
   }
});

module.exports = router;