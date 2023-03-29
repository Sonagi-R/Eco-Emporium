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
        const newItem = {"description": "Test Object", "image_url": "https://google.com", "item_id": 10, "name": "Test", "price": 9}
        const res = await request.post('/items');
        

        expect(res.statusCode).toBe(201);
        expect(res.body).toStrictEqual(newItem);
    })




})




















// const app = require('./app.js');
// const supertest = require('supertest-session');

// const request = supertest(app);

// describe('Event Routes - /events - not logged in', () => {

//     it('GET /events/all - Should get all events.', async () => {
//         const response = await request.get('/events/all');

//         expect(response.statusCode).toBe(200);
//         expect(typeof response.body[0].event_id).toBe("number");
//         expect(typeof response.body[0].description).toBe("string");
//     });

//     it('GET /events - Should respond with unauthorised', async () => {
//         const response = await request.get('/events');

//         let message = JSON.stringify({ message: 'You need to be logged in to see this route.' });

//         expect(response.statusCode).toBe(401);
//         expect(JSON.stringify(response.body)).toBe(message);
//     });

// });

// describe('Auth Routes - /auth', () => {
//     it('POST /auth/login - Should log me in as admin.', async () => {
//         const response = await request.post('/auth/login').send({ username: "admin", password: "admin" });

//         expect(response.statusCode).toBe(200);
//         expect(response.body.authenticated).toBe(true);
//     });

//     it('GET /events - Should respond with array of user items', async () => {
//         const response = await request.get('/events');

//         expect(response.statusCode).toBe(200);
//         expect(typeof response.body[0].event_id).toBe("number");
//     });

//     it('POST /auth/logout - Should log me out of the admin account', async () => {
//         const response = await request.get('/auth/logout');

//         expect(response.statusCode).toBe(200);
//         expect(response.body.authenticated).toBe(false);
//     });
// });

