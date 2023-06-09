const db = require('../database/connect')

class Item {
    constructor({ user_id, item_id, name, category, description, price, image_url, additional_imgs }) {
        this.user_id = user_id;
        this.item_id = item_id;
        this.user_id = user_id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.price = price;
        this.image_url = image_url;
        this.additional_imgs = additional_imgs;
    }

    static async showAll() {
        const response = await db.query('SELECT * FROM items ORDER BY item_id');
        return response.rows.map(i => new Item(i));
    }

    static async getOneById(idx) {
        const response = await db.query('SELECT * FROM items WHERE item_id = $1;', [idx])
        if (response.rows.length != 1) {
            throw new Error('unable to locate item')
        }
        return new Item(response.rows[0])
    }

    static async getByUserId(idx) {
        const response = await db.query('SELECT * FROM items WHERE user_id = $1;', [idx])
        return response.rows.map(i => new Item(i));
    }

    static async create(newItem) {
        const { name, user_id, category, price, description, image_url, additional_imgs } = newItem
        const response = await db.query('INSERT INTO items (name, user_id, category, price, description, image_url, additional_imgs) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;', [name, user_id, category, price, description, image_url, additional_imgs])
     
        if (response.rows.length != 1) {
            throw new Error('Could not add item to the database')
        }
        return response.rows.map(j => new Item(j));
    }

    async destroy() {
        const response = await db.query('DELETE FROM items WHERE LOWER(name) = $1 returning *', [this.name.toLowerCase()])
        return new Item(response.rows[0])
    }

    async update(updateItem) {
        const keyArray = ['name', 'price', 'description', 'image_url']
        for (let i = 0; i < keyArray.length; i++){
            if (!updateItem[`${keyArray[i]}`]) {
                updateItem[`${keyArray[i]}`] = this[`${keyArray[i]}`]
            }
        }
        const response = await db.query('UPDATE items SET name=$1, price=$2, description=$3, image_url=$4 WHERE  name =$5 returning *', [updateItem.name, updateItem.price, updateItem.description, updateItem.image_url, this.name])
        return new Item(response.rows[0])
    }
}

module.exports = Item
