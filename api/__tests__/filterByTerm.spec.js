const supertest = require('supertest');
const expect = require('expect');
const app = require('../app');
const db = require('../database/connect')
require('dotenv').config()

const request = supertest(app);
const endpoint = '/items'


describe(endpoint, () => {
    beforeAll(async () => {
        await db.connect();
    })

    afterAll(async () => {
    })

    describe('GET /', () => {
        it('should return all shop items', async () => {

            const res = await request.get(endpoint);
            expect(res.statusCode).toEqual(200);
            expect(Array.isArray(res.body)).toBeTruthy();
        })
    })


  });
