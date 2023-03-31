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
    image_url VARCHAR(8000),
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
        'Nike Air Jordan 1 Mid Shoes Trainers',
        1,
        4726,
        'Clothes',
        'Bought just over a year ago and worn perhaps 5 times - aside from a little dirt they are in great condition.',
        'https://i.ebayimg.com/images/g/~E0AAOSwGuRkJo~8/s-l500.jpg',
        'https://i.ebayimg.com/images/g/seoAAOSwO0dkJo~7/s-l500.jpg, https://i.ebayimg.com/images/g/hxAAAOSwzNNkJo~8/s-l500.jpg, https://i.ebayimg.com/images/g/YLQAAOSwL6NkJo~8/s-l500.jpg'
    ),
    (
        'Black tunic dress in xl from HM',
        1,
        1500,
        'Clothes',
        'Black tunic dress in xl from HM. In soft viscose and in excellent condition. So take a look 😊',
        'https://i.ebayimg.com/images/g/8GoAAOSw9dpkJOOv/s-l500.jpg',
        'https://i.ebayimg.com/images/g/sHcAAOSwxcFkJOOw/s-l500.jpg, https://i.ebayimg.com/images/g/u5MAAOSwZs5kJOOx/s-l500.jpg, https://i.ebayimg.com/images/g/KBkAAOSwRelkJOOy/s-l500.jpg'
    ),
    (
        'LADIES M&S SIZE 12 14 16 20 OR 22 WHITE COTTON BRODERIE',
        1,
        1699,
        'Clothes',
        'LADIES M&S PURE COTTON BLOUSE TOP',
        'https://i.ebayimg.com/images/g/xP8AAOSwXYdkG4U2/s-l500.jpg',
        'https://i.ebayimg.com/images/g/dC0AAOSwEIxkG4VI/s-l500.jpg, https://i.ebayimg.com/images/g/7eoAAOSw2ENkG4Vi/s-l500.jpg, https://i.ebayimg.com/images/g/DqMAAOSwwmBkG4TY/s-l500.jpg'
    ),
    (
        'Mens champion navy blue full zip hoodie size xl',
        1,
        1295,
        'Clothes',
        'Mens champion navy blue full zip hoodie size xl. There is a few marks as shown in photos.',
        'https://i.ebayimg.com/images/g/OLIAAOSwqgxjSatK/s-l500.jpg',
        'https://i.ebayimg.com/images/g/AwoAAOSwVnZjSatM/s-l500.jpg, https://i.ebayimg.com/images/g/m8wAAOSwMsdjSatP/s-l500.jpg, https://i.ebayimg.com/images/g/mVkAAOSw25pjSatX/s-l500.jpg'
    ),
    (
        'tommy hilfiger hoodie sweatshirt large xl Ladies Men’s Unisex',
        1,
        2390,
        'Clothes',
        'tommy hilfiger hoodie sweatshirt large xl Ladies Men’s Unisex. Great looking - minor marks but overall in good condition',
        'https://i.ebayimg.com/images/g/EJQAAOSw6CdkHXtb/s-l500.jpg',
        'https://i.ebayimg.com/images/g/KH0AAOSw-GtkHXtU/s-l500.jpg, https://i.ebayimg.com/images/g/oq8AAOSw~xRkHXtW/s-l500.jpg, https://i.ebayimg.com/images/g/H9IAAOSwxPFkHXtY/s-l500.jpg'
    ),
    (
        'Trousers next size W34” L31” black polyester straight leg dress pants mens',
        1,
        899,
        'Clothes',
        'Trousers next size W34” L31” black polyester straight leg dress pants mens. Condition is good',
        'https://i.ebayimg.com/images/g/ugoAAOSwMWpkGwkw/s-l500.jpg',
        'https://i.ebayimg.com/images/g/qVoAAOSw~xJkGwky/s-l500.jpg, https://i.ebayimg.com/images/g/qWEAAOSw~xJkGwkz/s-l500.jpg, https://i.ebayimg.com/images/g/pyUAAOSwEIxkGwk2/s-l500.jpg'
    ),
    (
        'Ladies Paprika Multi Coloured Trousers Size Meduim side hem split',
        1,
        872,
        'Clothes',
        '',
        'https://i.ebayimg.com/images/g/lycAAOSwDFNkDw6G/s-l500.jpg',
        'https://i.ebayimg.com/images/g/x2AAAOSw~2pkDw6L/s-l500.jpg, https://i.ebayimg.com/images/g/1cgAAOSwCtdkDw5~/s-l500.jpg, https://i.ebayimg.com/images/g/PhYAAOSwNbpkDw6B/s-l500.jpg'
    ),
    (
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather Windproof Black medium',
        1,
        1275,
        'Pet Supplies',
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather Windproof Black medium.',
        'https://i.ebayimg.com/images/g/nPYAAOSw3w1kHan0/s-l500.jpg',
        'https://i.ebayimg.com/images/g/7UQAAOSw6d1kHan2/s-l500.jpg, https://i.ebayimg.com/images/g/X2QAAOSw6CdkHan3/s-l500.jpg, https://i.ebayimg.com/images/g/nPwAAOSw3w1kHan4/s-l500.jpg'
    );