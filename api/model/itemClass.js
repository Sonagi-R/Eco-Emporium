const db = require('../database/connect.js')

class Item {
    constructor(item) {
        this.name = item.name;
        this.detail = item.detail;
        this.price = item.price;

    }

    static async showAll() {
        const response = await db.query('SELECT * FROM items;');
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
        const { name, price, details } = newItem
        const response = await db.query('INSERT INTO items (name, price, details) VALUES ($1, $2, $3) RETURNING *;', [name, price, details])

        if (response.rows.length != 1) {
            throw new Error('Could not add item to the database')
        }
    }

    async destroy() {
        const response = await db.query('DELETE FROM items WHERE LOWER(name) = $1 returning *', [this.name.toLowerCase()])
        return new Item(response.rows[0])
    }

    async update(updateItem) {
        const { name, price, details } = item 
        const response = await db.query('UPDATE items SET name=$1, price=$2, details=$3 WHERE  name =$4 returning *', [name, price, details, this.name])
        return new Item(response.rows[0])
    }


}