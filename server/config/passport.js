import passport from 'passport';
import {Strategy ,ExtractJwt} from 'passport-jwt'
import User from '../Models/User.js';
const jwtSecret = "EcoCred#Carbon@X"

passport.use(new Strategy({
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: jwtSecret
},(jwt_payload, done) => {
    User.findById(jwt_payload.sub)
      .then(user => {
        if (user) {
          return done(null, user);
        } else {
          return done(null, false);
        }
      })
      .catch(err => done(err, false));
}))

passport.serializeUser((user, done) => {
done(null, user.id);
});

passport.deserializeUser((id, done) => {
User.findById(id).then(user => {
    done(null, user);
});
});