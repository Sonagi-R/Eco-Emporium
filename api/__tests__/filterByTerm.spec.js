require('dotenv').config()
const app = require('../app.js');
const supertest = require('supertest-session');

const request = supertest(app);


describe('Auth Routes - /auth', () => {
    it('Should allow user to register a new account', async () => {
        const res = await request.post('/auth/register').send({ username: "test", email: "test@gmail.com", password: "test" });

        expect(res.statusCode).toBe(201);
    })

    it('Should log user in as admin', async () => {
        const res = await request.post('/auth/login').send({ username: "admin", password: "admin" });

        expect(res.statusCode).toBe(200);
        expect(res.body.authenticated).toBe(true);
    });

    it('Should log user out of the admin account', async () => {
        const res = await request.get('/auth/logout');

        expect(res.statusCode).toBe(200);
        expect(res.body.authenticated).toBe(false);
    });
})

describe('Item Routes - /items', () => {
    it('Should log user in as admin', async () => {
        const res = await request.post('/auth/login').send({ username: "admin", password: "admin" });

        expect(res.statusCode).toBe(200);
        expect(res.body.authenticated).toBe(true);
    });

    it('Should return all shop items', async () => {
        session = ({
            secret: process.env.SECRET,
            saveUninitialized: false,
            resave: true,
          })
        const res = await request.get('/items');

        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    })

    it('Should return one item', async () => {
        const res = await request.get('/items/2');
        const item2 = {"description": "Experience high-quality sound and portability with this wireless Bluetooth speaker. It's waterproof and has a long battery life.", "image_url": "https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502", "item_id": 2, "name": "Wireless Bluetooth Speaker", "price": 7000}

        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual(item2);
    })

    it('Should create one item', async () => {
        const newItem = {
            "user_id": 1,
            "name": "Test",
            "price": 9,
            "category": "Clothes",
            "description": "Test Object", 
            "image_url": "https://google.com/",
            "additional_imgs": "https://google.com/"
          }
        const res = await request.post('/items');
        

        expect(res.statusCode).toBe(201);
        expect(res.body).toStrictEqual(newItem);
    })




})

