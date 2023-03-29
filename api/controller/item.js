const Item = require('../model/itemClass.js')

async function index(req, res) {
    try {
        const items = await Item.showAll();
        res.status(200).json(items);
    } catch (error) {
        res.status(401).send({error:'Cannot access without logging in'})
    }
}

async function getOneById(req, res) {
    const idx= req.params.id
    try {
        const item = await Item.getOneById(idx)
        res.status(200).send(item)
    } catch (error) {
        res.status(404).send({error:"item not found"})
    }
}

async function create(req, res) {
    const item = req.body
    try {
        const newItem = await Item.create(item)
        res.status(201).send(newItem)
    } catch (error) {
        res.status(500).send({error: 'Error with the item database'})
    }
}

async function destroy(req, res) {
    const idx = parseInt(req.params.id)
    try {
        const item = await Item.getOneById(idx)
        const result = await item.destroy()
        res.status(200).send(result)
    } catch (error) {
        res.status(500).send({error: "Error with the item database"})
    }
}

async function update(req, res) {
    const idx = parseInt(req.params.id)
    const updateItem = req.body
    try {
        const item = await Item.getOneById(idx)
        const result = await item.update(updateItem)
        res.status(200).send(result)
    } catch (error) {
        res.status(500).send({error: "Error with the item database"})
    }
}

module.exports = {index, getOneById, create, destroy, update}
