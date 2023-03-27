async function auth(req, res, next) {
  if (req.session.authenticated) {
    let user = req.session;
    next();
  } else {
    res.status(403).json({ error: "you should not be here!" });
  }
}

module.exports = auth;
