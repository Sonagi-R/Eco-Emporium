const db = require('../database/connect')

class Item {
    constructor({ name, description, price, image_url }) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.image_url = image_url;
    }

    static async showAll() {
        const response = await db.query('SELECT * FROM items ORDER BY item_id');
        return response.rows.map(i => new Item(i));
    }

    static async getOneById(idx) {
        const response = await db.query('SELECT * FROM items WHERE item_id = $1;', [idx])
        if (response.rows.length != 1) {
            throw new Error('unable to lacte item')
        }
        return new Item(response.rows[0])
    }

    static async create(newItem) {
        const { name, price, description, image_url } = newItem
        const response = await db.query('INSERT INTO items (name, price, details) VALUES ($1, $2, $3, $4) RETURNING *;', [name, price, description, image_url])

        if (response.rows.length != 1) {
            throw new Error('Could not add item to the database')
        }
    }

    async destroy() {
        const response = await db.query('DELETE FROM items WHERE LOWER(name) = $1 returning *', [this.name.toLowerCase()])
        return new Item(response.rows[0])
    }

    async update(updateItem) {
        const { name, price, description, image_url } = item 
        const response = await db.query('UPDATE items SET name=$1, price=$2, details=$3, image_url=$4 WHERE  name =$5 returning *', [name, price, description, image_url, this.name])
        return new Item(response.rows[0])
    }


}

module.exports = Item