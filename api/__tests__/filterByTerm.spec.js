require('dotenv').config()
const app = require('../app.js');
const supertest = require('supertest-session');

const request = supertest(app);


describe('Auth Routes - /auth', () => {
    it('Should not allow user to access main page if not logged in', async () => {
        const res = await request.get('/items');
        const err = { error: "you should not be here!" }
        expect(res.statusCode).toBe(403);
        expect(res.body).toStrictEqual(err);
    })


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
        process.env.IN_TEST = 'true';
        const res = await request.get('/auth/logout');

        console.log(res.body)

        expect(res.statusCode).toBe(200);
        expect(res.body.authenticated).toBe(false);
        process.env.IN_TEST = 'false';
    });
})


describe('Item Routes - /items', () => {
    it('Should return all shop items', async () => {
        process.env.IN_TEST = 'true';

        const res = await request.get('/items');

        expect(res.statusCode).toBe(200);
        process.env.IN_TEST = 'false';
    })

    it('Should return one item', async () => {
        process.env.IN_TEST = 'true';
        const res = await request.get('/items/2');
        const item2 = {"additional_imgs": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ", "category": "Electronics","description": "Experience high-quality sound and portability with this wireless Bluetooth speaker. It's waterproof and has a long battery life.", "image_url": "https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502", "item_id": 2, "name": "Wireless Bluetooth Speaker", "price": 7000, "user_id": 1}

        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual(item2);
        process.env.IN_TEST = 'false';
    })

    it('Should create one item', async () => {
        process.env.IN_TEST = 'true';
        const newItem = [{
            "user_id": 1,
            "name": "Test",
            "price": 9,
            "category": "Clothes",
            "description": "Test Object", 
            "image_url": "https://google.com/",
            "additional_imgs": "https://google.com/"
          }]
        const res = await request.post('/items').send(newItem);
        
        console.log(res.body)
        expect(res.statusCode).toBe(201);
        expect(res.body).toStrictEqual(newItem);
        process.env.IN_TEST = 'false';
    })

    it('Should not be able to create an item with missing values', async () => {
        process.env.IN_TEST = 'true';
        const newItem = {
            "user_id": 1,
            "name": "Test",
            "price": 9
          }
        const res = await request.post('/items').send(newItem);
        const err = {error: "Error with the item database"}
        
        console.log(res.body)
        expect(res.statusCode).toBe(500);
        expect(res.body).toStrictEqual(err);
        process.env.IN_TEST = 'false';
    })

    it('Should update one item', async () => {
        process.env.IN_TEST = 'true';
        const item2 = {"additional_imgs": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ", "category": "Electronics","description": "Amended.", "image_url": "https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502", "item_id": 2, "name": "Amended", "price": 7, "user_id": 1}

        const res = await request.patch('/items/2').send({"additional_imgs": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ", "category": "Electronics","description": "Amended.", "image_url": "https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502", "item_id": 2, "name": "Amended", "price": 7, "user_id": 1});
        
        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual(item2);
        process.env.IN_TEST = 'false';
    })


    it('Should delete one item', async () => {
        process.env.IN_TEST = 'true';

        const res = await request.delete('/items/2');
    
        expect(res.statusCode).toBe(200);

        const response = await request.get('/items/2');

        expect(response.statusCode).toBe(404);
        process.env.IN_TEST = 'false';
    })

    it('Should show items by user', async () => {
        process.env.IN_TEST = 'true';
        const res = await request.get('/items/user/1');

        expect(res.statusCode).toBe(200);
        process.env.IN_TEST = 'false';
    });

    it('Should show fail to show items by nonexistent user', async () => {
        process.env.IN_TEST = 'true';
        const res = await request.get('/items/user/10');
        const err = {error:"item not found"}

        expect(res.statusCode).toBe(404);
        expect(res.body).toBe(err);
    });



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

