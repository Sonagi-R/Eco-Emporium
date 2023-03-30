DROP TABLE IF EXISTS items;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (user_id)
);

INSERT INTO
    users (username, email, password, is_admin)
VALUES
    (
        'admin',
        'admin@test123.com',
        '$2b$10$wgc2myC/L8NmDGsfmonl1.2jlN2L8pWauyQG9XNoLUmjtlztr0kVy',
        true
    ),
    (
        'user',
        'user@test123.com',
        '$2b$10$Rg2AXCBalbVJb8p1eQZOL.Aq/Ir/RRU8tT17OvBHZtpSqL6mM4YJO',
        false
    );

CREATE TABLE items(
    item_id INT GENERATED ALWAYS AS IDENTITY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    image_url VARCHAR(255),
    additional_imgs VARCHAR(8000),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    PRIMARY KEY (item_id)
);

INSERT INTO
    items(
        name,
        user_id,
        price,
        category,
        description,
        image_url,
        additional_imgs
    )
VALUES
    (
        'Laptop Backpack',
        1,
        8015,
        'Clothes',
        'This sleek and durable laptop backpack features multiple compartments and a padded sleeve to keep your laptop safe and secure.',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXsKib2hN1Hhm0nk-GLbP4CHna7WSyziaYEA&usqp=CAU',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Wireless Bluetooth Speaker',
        1,
        7000,
        'Electronics',
        'Experience high-quality sound and portability with this wireless Bluetooth speaker. It''s waterproof and has a long battery life.',
        'https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Smartphone Gimbal Stabilizer',
        1,
        12030,
        'Electronics',
        'Capture professional-grade videos with this smartphone gimbal stabilizer. It''s easy to use and has multiple modes for different shooting scenarios.',
        'https://www.omnicoreagency.com/wp-content/uploads/2020/01/Zhiyun-Smooth-Q2-3-Axis-Handheld-Smartphone-Gimbal-Stabilizer-Table.jpg',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Leather Wallet',
        1,
        5050,
        'Clothes',
        'Keep your cash and cards organized with this stylish leather wallet. It has multiple compartments and a secure zippered closure.',
        'https://revaayat.co.uk/wp-content/uploads/2021/05/GIX043.png',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Electric Toothbrush',
        1,
        9000,
        'Electronics',
        'Achieve a brighter, healthier smile with this electric toothbrush. It has multiple settings and a timer to ensure thorough cleaning.',
        'https://growingsmiles.co.uk/wp-content/uploads/SURI-cover.png',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Travel Pillow',
        1,
        2510,
        'Outdoor & Garden',
        'Get a comfortable and restful sleep while traveling with this travel pillow. It''s lightweight and compact, making it easy to carry.',
        'https://asset1.cxnmarksandspencer.com/is/image/mands/Memory-Foam-Travel-Pillow-1/PL_05_T40_8413L_T0_X_EC_0?$PDP_IMAGEGRID_1_LG$',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Vintage Leather Bag',
        1,
        12005,
        'Clothes',
        'Handcrafted from high-quality leather, this vintage-style bag features multiple compartments and a sturdy strap for comfortable wear.',
        'https://i.ebayimg.com/images/g/zcYAAOSw4OFd5jFH/s-l500.jpg',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Designer Sunglasses',
        1,
        18040,
        'Clothes',
        'Make a fashion statement with these stylish sunglasses from a top designer brand. The frames are made from durable materials and the lenses provide 100% UV protection.',
        'https://www.internetspecs.co.uk/user/products/large/radley-rayanna-designer-sunglasses-107.jpg',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'Wireless Headphones',
        1,
        10060,
        'Electronics',
        'Experience crystal-clear sound and freedom of movement with these wireless headphones. They have a long battery life and are compatible with a range of devices.',
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MXJ92?wid=2104&hei=2980&fmt=jpeg&qlt=95&.v=1580420175341',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    ),
    (
        'EVGA GTX 980 TI Reference Card - 6GB GDDR5',
        1,
        11999,
        'Electronics',
        'EVGA GTX 980 TI Reference Card - 6GB GDDR5. Card works great, I have applied new arctic mx-4 to the gpu so it runs cooler.',
        'https://i.ebayimg.com/images/g/t9kAAOSwZ-lkGb8w/s-l500.jpg',
        'https://i.ebayimg.com/images/g/0JYAAOSwyk9kGb7F/s-l500.jpg, https://i.ebayimg.com/images/g/pScAAOSwRvdkGb7G/s-l500.jpg, https://i.ebayimg.com/images/g/-R8AAOSwSTpkGb7H/s-l500.jpg'
    ),
    (
        'Cosori Electric Kettle, Glass Kettle, 3000W',
        1,
        2099,
        'Electronics',
        'Cosori Electric Kettle, Glass Kettle, 3000W. Clear kettle & energy efficient save upto 66% energy by just boiling one cup 250ml that you needed. illuminating indicator. Condition is used but in good condition.',
        'https://i.ebayimg.com/images/g/c7sAAOSwYX9jpKZq/s-l500.jpg',
        'https://i.ebayimg.com/images/g/3CgAAOSwjqljpKZy/s-l500.jpg, https://i.ebayimg.com/images/g/yZUAAOSwI29jpKZ0/s-l500.jpg, https://i.ebayimg.com/images/g/ljMAAOSwocJjpKZ2/s-l500.jpg'
    ),
    (
        '1960’s Vintage Dress Size M/L',
        1,
        3600,
        'Clothes',
        '1960’s Dress By Blues Floral print. Knee length. Size 12. Nice pre loved condition Fabulous piece',
        'https://i.ebayimg.com/images/g/UEIAAOSwre5kJUir/s-l300.jpg',
        'https://i.ebayimg.com/images/g/reYAAOSwRelkJUiu/s-l300.jpg, https://i.ebayimg.com/images/g/xZsAAOSwSPRkJUi1/s-l300.jpg, https://i.ebayimg.com/images/g/l0IAAOSwIXlkJUi4/s-l300.jpg'
    ),
    (
        'Vintage Leather Briefcase',
        1,
        7500,
        'Clothes',
        'This vintage leather briefcase is the perfect accessory for any professional. Made from high-quality leather, it features a spacious interior and multiple compartments for all your business needs. The classic design ensures that it will never go out of style.',
        'https://i.ebayimg.com/images/g/phIAAOSwmQRkFKXe/s-l300.jpg',
        'https://i.ebayimg.com/images/g/mDUAAOSwVWhkFKYA/s-l300.jpg, https://i.ebayimg.com/images/g/-hkAAOSwxN5kFKWA/s-l300.jpg, https://i.ebayimg.com/images/g/MMoAAOSwTh9kFKXj/s-l300.jpg'
    ),
    (
        '"DANSETTE VIVA" VINTAGE RECORD PLAYER',
        1,
        15000,
        'Electronics',
        'This is a 1960s Dansette Viva record player that has been fully restored and is in full working order and in very nice refurbished condition for its age. The valve amplifier has been fully serviced, ALL capacitors replaced, including electrolytics, and resistors checked and replaced where necessary to ensure it sounds just as it did when new in the 1960s.  The two controls for Volume and Tone operate perfectly and it has an excellent sound output - loud and clear, as intended by Dansette.',
        'https://i.ebayimg.com/images/g/NpcAAOSwV21kIbjp/s-l500.jpg',
        'https://i.ebayimg.com/images/g/NpYAAOSwV21kIbjo/s-l500.jpg, https://i.ebayimg.com/images/g/KfQAAOSwxN5kIbjp/s-l500.jpg, https://i.ebayimg.com/images/g/jw8AAOSwPgZkIbjn/s-l500.jpg'
    ),
    (
        'Drink Coca cola vintage UK sign 1950s Chicken Chips Chip Shop advertising',
        1,
        28000,
        'Electronics',
        'Drink Coca cola vintage UK sign 1950s Chicken Chips Chip Shop advertising.',
        'https://i.ebayimg.com/images/g/tlAAAOSwRcRkJUwE/s-l500.jpg',
        'https://i.ebayimg.com/images/g/vT4AAOSwvuZkJUwO/s-l500.jpg, https://i.ebayimg.com/images/g/sTIAAOSwc8VkJUw1/s-l500.jpg, https://i.ebayimg.com/images/g/AkkAAOSw35pkJUwT/s-l500.jpg'
    ),
    (
        'T-shirt Marvel Lootwear Venom Movie T-shirt',
        1,
        700,
        'Clothes',
        'T-shirt Marvel Lootwear Venom Movie T-shirt.',
        'https://i.ebayimg.com/images/g/WdEAAOSwv6Bjxtkk/s-l500.jpg',
        'https://i.ebayimg.com/images/g/9qYAAOSwc5xjxtkm/s-l500.jpg'
    ),
    (
        'ELVIS PRESLEY T Shirt Medium Black King Of Rock Graphic Print Short Sleeve Mens',
        1,
        1248,
        'Clothes',
        'ELVIS PRESLEY T Shirt Medium Black King Of Rock Graphic Print Short Sleeve Mens',
        'https://i.ebayimg.com/images/g/d44AAOSwYJVkJFak/s-l500.jpg',
        'https://i.ebayimg.com/images/g/NK8AAOSwmCVkJFal/s-l500.jpg, https://i.ebayimg.com/images/g/uUMAAOSwA~tkJFam/s-l500.jpg, https://i.ebayimg.com/images/g/tCcAAOSwySVkJFak/s-l500.jpg'
    ),
    (
        'Dryrobe Dog robe black/ red inner medium',
        1,
        605,
        'Pet Supplies',
        'Dryrobe Dog robe black/ red inner medium. Used but in good condition. (Dog grew!)',
        'https://i.ebayimg.com/images/g/VeAAAOSwf4FkIY1o/s-l500.jpg',
        'https://i.ebayimg.com/images/g/AjMAAOSwB2NkIY1p/s-l500.jpg, https://i.ebayimg.com/images/g/y-YAAOSwP8dkIY1q/s-l500.jpg, https://i.ebayimg.com/images/g/kkUAAOSwg3pkIY1r/s-l500.jpg'
    ),
    (
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather Windproof Black medium',
        1,
        1275,
        'Pet Supplies',
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather Windproof Black medium.',
        'https://i.ebayimg.com/images/g/nPYAAOSw3w1kHan0/s-l500.jpg',
        'https://i.ebayimg.com/images/g/7UQAAOSw6d1kHan2/s-l500.jpg, https://i.ebayimg.com/images/g/X2QAAOSw6CdkHan3/s-l500.jpg, https://i.ebayimg.com/images/g/nPwAAOSw3w1kHan4/s-l500.jpg'
    ),
    (
        'Eco-Friendly Water Bottle',
        1,
        2570,
        'Sports & Recreation',
        'Reduce your environmental footprint with this eco-friendly water bottle made from recycled materials. It''s durable, leak-proof, and easy to carry.',
        'https://cdn.shopify.com/s/files/1/0957/0496/products/black-blum-glass-water-bottle-olive-600ml-378961_1000x.jpg?v=1660560895',
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.startech.com%2Fen-gb%2Fdisplay-mounting-ergonomics%2Fntbkbag156&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAI, https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81CGfbtI1cS._AC_SL1500_.jpg, https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.samsonite.co.uk%2Flitepoint-laptop-backpack-15.6---black%2F134549-1041.html&psig=AOvVaw0_cr5mohTcaUy9ITWPrOwM&ust=1680165067763000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCOicueHcgP4CFQAAAAAdAAAAABAZ'
    );