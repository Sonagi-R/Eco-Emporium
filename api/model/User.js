const db = require('../database/connect')

class User {
  constructor({ user_id, username, password, is_admin}) {
    this.user_id = user_id;
    this.username = username;
    this.password = password;
    this.is_admin = is_admin;
  }

  static async getOneById(user_id) {
    const response = await db.query("SELECT * FROM users WHERE user_id = $1", [user_id]);
    if (response.rows.length != 1) {
        throw new Error("Unable to locate user.");
    }
    return new User(response.rows[0]);
  }

  static async getOneByUsername(username) {
    const response = await db.query("SELECT * FROM users WHERE username = $1", [username]);
    if (response.rows.length != 1) {
        throw new Error("Unable to locate user.");
    }
    return new User(response.rows[0]);
  }
  
  static async create(data) {
    const { username, email, password } = data;
    let response = await db.query("INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING user_id;",
        [username, email, password]);
    const newId = response.rows[0].user_id;
    const newUser = await User.getOneById(newId);
    return newUser;
  }

  async update(data) {
    
    let updatedUser = await db.query("UPDATE users SET  = $1 WHERE snack_id = $2 RETURNING snack_id, votes;",
        [ this.votes + data.votes, this.id ]);
    if (updatedSnack.rows.length != 1) {
        throw new Error("Unable to update votes.")
    }
    return new Snack(updatedSnack.rows[0]);
  }
}


module.exports = User;
