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
    ),
    (
        'Cosgun',
        'cosgun@cosgun.com',
        '$2b$10$wgc2myC/L8NmDGsfmonl1.2jlN2L8pWauyQG9XNoLUmjtlztr0kVy',
        false
    ),
    (
        'Ana',
        'ana@ana.com',
        '$2b$10$wgc2myC/L8NmDGsfmonl1.2jlN2L8pWauyQG9XNoLUmjtlztr0kVy',
        false
    ),
    (
        'Lewis',
        'lewis@lewis.com',
        '$2b$10$wgc2myC/L8NmDGsfmonl1.2jlN2L8pWauyQG9XNoLUmjtlztr0kVy',
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
        3,
        11999,
        'Electronics',
        'EVGA GTX 980 TI Reference Card - 6GB GDDR5. Card works great, I have applied new arctic mx-4 to the gpu so it runs cooler.',
        'https://i.ebayimg.com/images/g/t9kAAOSwZ-lkGb8w/s-l500.jpg',
        'https://i.ebayimg.com/images/g/0JYAAOSwyk9kGb7F/s-l500.jpg, https://i.ebayimg.com/images/g/pScAAOSwRvdkGb7G/s-l500.jpg, https://i.ebayimg.com/images/g/-R8AAOSwSTpkGb7H/s-l500.jpg'
    ),
    (
        'Cosori Electric Kettle, Glass Kettle, 3000W',
        3,
        2099,
        'Electronics',
        'Cosori Electric Kettle, Glass Kettle, 3000W. Clear kettle & energy efficient save upto 66% energy by just boiling one cup 250ml that you needed. illuminating indicator. Condition is used but in good condition.',
        'https://i.ebayimg.com/images/g/c7sAAOSwYX9jpKZq/s-l500.jpg',
        'https://i.ebayimg.com/images/g/3CgAAOSwjqljpKZy/s-l500.jpg, https://i.ebayimg.com/images/g/yZUAAOSwI29jpKZ0/s-l500.jpg, https://i.ebayimg.com/images/g/ljMAAOSwocJjpKZ2/s-l500.jpg'
    ),
    (
        '1960’s Vintage Dress Size M/L',
        5,
        3600,
        'Clothes',
        '1960’s Dress By Blues Floral print. Knee length. Size 12. Nice pre loved condition Fabulous piece',
        'https://i.ebayimg.com/images/g/UEIAAOSwre5kJUir/s-l300.jpg',
        'https://i.ebayimg.com/images/g/reYAAOSwRelkJUiu/s-l300.jpg, https://i.ebayimg.com/images/g/xZsAAOSwSPRkJUi1/s-l300.jpg, https://i.ebayimg.com/images/g/l0IAAOSwIXlkJUi4/s-l300.jpg'
    ),
    (
        'Vintage Leather Briefcase',
        4,
        7500,
        'Clothes',
        'This vintage leather briefcase is the perfect accessory for any professional. Made from high-quality leather, it features a spacious interior and multiple compartments for all your business needs. The classic design ensures that it will never go out of style.',
        'https://i.ebayimg.com/images/g/phIAAOSwmQRkFKXe/s-l300.jpg',
        'https://i.ebayimg.com/images/g/mDUAAOSwVWhkFKYA/s-l300.jpg, https://i.ebayimg.com/images/g/-hkAAOSwxN5kFKWA/s-l300.jpg, https://i.ebayimg.com/images/g/MMoAAOSwTh9kFKXj/s-l300.jpg'
    ),
    (
        '"DANSETTE VIVA" VINTAGE RECORD PLAYER',
        5,
        15000,
        'Electronics',
        'This is a 1960s Dansette Viva record player that has been fully restored and is in full working order and in very nice refurbished condition for its age. The valve amplifier has been fully serviced, ALL capacitors replaced, including electrolytics, and resistors checked and replaced where necessary to ensure it sounds just as it did when new in the 1960s.  The two controls for Volume and Tone operate perfectly and it has an excellent sound output - loud and clear, as intended by Dansette.',
        'https://i.ebayimg.com/images/g/NpcAAOSwV21kIbjp/s-l500.jpg',
        'https://i.ebayimg.com/images/g/NpYAAOSwV21kIbjo/s-l500.jpg, https://i.ebayimg.com/images/g/KfQAAOSwxN5kIbjp/s-l500.jpg, https://i.ebayimg.com/images/g/jw8AAOSwPgZkIbjn/s-l500.jpg'
    ),
    (
        'Drink Coca cola vintage UK sign 1950s Chicken Chips Chip Shop advertising',
        4,
        28000,
        'Electronics',
        'Drink Coca cola vintage UK sign 1950s Chicken Chips Chip Shop advertising.',
        'https://i.ebayimg.com/images/g/tlAAAOSwRcRkJUwE/s-l500.jpg',
        'https://i.ebayimg.com/images/g/vT4AAOSwvuZkJUwO/s-l500.jpg, https://i.ebayimg.com/images/g/sTIAAOSwc8VkJUw1/s-l500.jpg, https://i.ebayimg.com/images/g/AkkAAOSw35pkJUwT/s-l500.jpg'
    ),
    (
        'T-shirt Marvel Lootwear Venom Movie T-shirt',
        4,
        700,
        'Clothes',
        'T-shirt Marvel Lootwear Venom Movie T-shirt.',
        'https://i.ebayimg.com/images/g/WdEAAOSwv6Bjxtkk/s-l500.jpg',
        'https://i.ebayimg.com/images/g/9qYAAOSwc5xjxtkm/s-l500.jpg'
    ),
    (
        'ELVIS PRESLEY T Shirt Medium Black King Of Rock Graphic Print Short Sleeve Mens',
        2,
        1248,
        'Clothes',
        'ELVIS PRESLEY T Shirt Medium Black King Of Rock Graphic Print Short Sleeve Mens',
        'https://i.ebayimg.com/images/g/d44AAOSwYJVkJFak/s-l500.jpg',
        'https://i.ebayimg.com/images/g/NK8AAOSwmCVkJFal/s-l500.jpg, https://i.ebayimg.com/images/g/uUMAAOSwA~tkJFam/s-l500.jpg, https://i.ebayimg.com/images/g/tCcAAOSwySVkJFak/s-l500.jpg'
    ),
    (
        'Dryrobe Dog robe black/ red inner medium',
        3,
        605,
        'Pet Supplies',
        'Dryrobe Dog robe black/ red inner medium. Used but in good condition. (Dog grew!)',
        'https://i.ebayimg.com/images/g/VeAAAOSwf4FkIY1o/s-l500.jpg',
        'https://i.ebayimg.com/images/g/AjMAAOSwB2NkIY1p/s-l500.jpg, https://i.ebayimg.com/images/g/y-YAAOSwP8dkIY1q/s-l500.jpg, https://i.ebayimg.com/images/g/kkUAAOSwg3pkIY1r/s-l500.jpg'
    ),
    (
        'Nike Air Jordan 1 Mid Shoes Trainers',
        5,
        4726,
        'Clothes',
        'Bought just over a year ago and worn perhaps 5 times - aside from a little dirt they are in great condition.',
        'https://i.ebayimg.com/images/g/~E0AAOSwGuRkJo~8/s-l500.jpg',
        'https://i.ebayimg.com/images/g/seoAAOSwO0dkJo~7/s-l500.jpg, https://i.ebayimg.com/images/g/hxAAAOSwzNNkJo~8/s-l500.jpg, https://i.ebayimg.com/images/g/YLQAAOSwL6NkJo~8/s-l500.jpg'
    ),
    (
        'Black tunic dress in xl from HM',
        3,
        1500,
        'Clothes',
        'Black tunic dress in xl from HM. In soft viscose and in excellent condition. So take a look 😊',
        'https://i.ebayimg.com/images/g/8GoAAOSw9dpkJOOv/s-l500.jpg',
        'https://i.ebayimg.com/images/g/sHcAAOSwxcFkJOOw/s-l500.jpg, https://i.ebayimg.com/images/g/u5MAAOSwZs5kJOOx/s-l500.jpg, https://i.ebayimg.com/images/g/KBkAAOSwRelkJOOy/s-l500.jpg'
    ),
    (
        'LADIES M&S SIZE 12 14 16 20 OR 22 WHITE COTTON BRODERIE',
        4,
        1699,
        'Clothes',
        'LADIES M&S PURE COTTON BLOUSE TOP',
        'https://i.ebayimg.com/images/g/xP8AAOSwXYdkG4U2/s-l500.jpg',
        'https://i.ebayimg.com/images/g/dC0AAOSwEIxkG4VI/s-l500.jpg, https://i.ebayimg.com/images/g/7eoAAOSw2ENkG4Vi/s-l500.jpg, https://i.ebayimg.com/images/g/DqMAAOSwwmBkG4TY/s-l500.jpg'
    ),
    (
        'Mens champion navy blue full zip hoodie size xl',
        3,
        1295,
        'Clothes',
        'Mens champion navy blue full zip hoodie size xl. There is a few marks as shown in photos.',
        'https://i.ebayimg.com/images/g/OLIAAOSwqgxjSatK/s-l500.jpg',
        'https://i.ebayimg.com/images/g/AwoAAOSwVnZjSatM/s-l500.jpg, https://i.ebayimg.com/images/g/m8wAAOSwMsdjSatP/s-l500.jpg, https://i.ebayimg.com/images/g/mVkAAOSw25pjSatX/s-l500.jpg'
    ),
    (
        'tommy hilfiger hoodie sweatshirt large xl Ladies Men’s Unisex',
        3,
        2390,
        'Clothes',
        'tommy hilfiger hoodie sweatshirt large xl Ladies Men’s Unisex. Great looking - minor marks but overall in good condition',
        'https://i.ebayimg.com/images/g/EJQAAOSw6CdkHXtb/s-l500.jpg',
        'https://i.ebayimg.com/images/g/KH0AAOSw-GtkHXtU/s-l500.jpg, https://i.ebayimg.com/images/g/oq8AAOSw~xRkHXtW/s-l500.jpg, https://i.ebayimg.com/images/g/H9IAAOSwxPFkHXtY/s-l500.jpg'
    ),
    (
        'Trousers next size W34” L31” black polyester straight leg dress pants mens',
        5,
        899,
        'Clothes',
        'Trousers next size W34” L31” black polyester straight leg dress pants mens. Condition is good',
        'https://i.ebayimg.com/images/g/ugoAAOSwMWpkGwkw/s-l500.jpg',
        'https://i.ebayimg.com/images/g/qVoAAOSw~xJkGwky/s-l500.jpg, https://i.ebayimg.com/images/g/qWEAAOSw~xJkGwkz/s-l500.jpg, https://i.ebayimg.com/images/g/pyUAAOSwEIxkGwk2/s-l500.jpg'
    ),
    (
        'Ladies Paprika Multi Coloured Trousers Size Meduim side hem split',
        4,
        872,
        'Clothes',
        'Ladies Paprika Multi Coloured Trousers Size Meduim.',
        'https://i.ebayimg.com/images/g/lycAAOSwDFNkDw6G/s-l500.jpg',
        'https://i.ebayimg.com/images/g/x2AAAOSw~2pkDw6L/s-l500.jpg, https://i.ebayimg.com/images/g/1cgAAOSwCtdkDw5~/s-l500.jpg, https://i.ebayimg.com/images/g/PhYAAOSwNbpkDw6B/s-l500.jpg'
    ),
    (
        'Ladies Womens Joggers lounge Wear Jack Wills Burgundy Jogging Bottoms Size 8',
        2,
        900,
        'Clothes',
        'Ladies Womens Joggers lounge Wear Jack Wills Burgundy Jogging Bottoms Size 8.',
        'https://i.ebayimg.com/images/g/B1QAAOSwrbRkGieq/s-l500.jpg',
        'https://i.ebayimg.com/images/g/YrgAAOSw-A9kGiec/s-l500.jpg, https://i.ebayimg.com/images/g/nwMAAOSwF2tkGifi/s-l500.jpg, https://i.ebayimg.com/images/g/WDkAAOSwL5BkGifn/s-l500.jpg'
    ),
    (
        'Soulcal&Co man’s cotton jumper.Size L.',
        3,
        1251,
        'Clothes',
        'Soulcal&Co man’s cotton jumper.Size L..',
        'https://i.ebayimg.com/images/g/AW8AAOSwv45kHfYR/s-l500.jpg',
        'https://i.ebayimg.com/images/g/MsUAAOSwmddkHfYT/s-l500.jpg, https://i.ebayimg.com/images/g/R9oAAOSwd2lkHfY6/s-l500.jpg, https://i.ebayimg.com/images/g/xEsAAOSw6jlkHfZ3/s-l500.jpg'
    ),
    (
        'Marks & Spencer Cream & Black Patterned Knit Vest',
        5,
        1251,
        'Clothes',
        'Marks & Spencer Cream & Black Patterned Knitted Vest Sleeveless Jumper Tank Size M',
        'https://i.ebayimg.com/images/g/wFYAAOSwJApkDgBy/s-l500.jpg',
        'https://i.ebayimg.com/images/g/EVUAAOSwKDtkDgBz/s-l500.jpg, https://i.ebayimg.com/images/g/mgkAAOSwQxNkDgB2/s-l500.jpg, https://i.ebayimg.com/images/g/19cAAOSwMVxkDgB4/s-l500.jpg'
    ),
    (
        '6 × Assorted Playstation/Xbox 360/PC Gamer Demo Disc DVD ROM.',
        4,
        799,
        'Electronics',
        'These demo discs are DVD ROM. Sold as a bundle only 6 in total. All are used and are in good condition.',
        'https://i.ebayimg.com/images/g/i7MAAOSwj8JjpFYK/s-l500.jpg',
        'https://i.ebayimg.com/images/g/FlQAAOSwsC5jpFYQ/s-l500.jpg, https://i.ebayimg.com/images/g/HX8AAOSw-KJjpFYW/s-l500.jpg, https://i.ebayimg.com/images/g/MlQAAOSwVhxjpFYe/s-l500.jpg'
    ),
    (
        'Dell HDMI monitor used 21 inch pre-owned',
        4,
        2529,
        'Electronics',
        'Pre-owned DELL HDMI monitor available for collection. Good Working condition',
        'https://i.ebayimg.com/images/g/KvwAAOSweL9kHyjh/s-l500.jpg',
        'https://i.ebayimg.com/images/g/HpkAAOSw4pNkHyjm/s-l500.jpg, https://i.ebayimg.com/images/g/tHEAAOSwWq1kHyjz/s-l500.jpg, https://i.ebayimg.com/images/g/fucAAOSwkptkHyjP/s-l500.jpg'
    ),
    (
        'Razer Seiren X Streaming USB Condenser Microphone',
        2,
        3999,
        'Electronics',
        'Seem to be very rare to come across, very good microphone, only use two or 3 times but still in good condition havent got the box but cable comes with the mic',
        'https://i.ebayimg.com/images/g/btkAAOSwDyVkJqBR/s-l500.jpg',
        'https://i.ebayimg.com/images/g/21wAAOSwSlFkJqBR/s-l500.jpg, https://i.ebayimg.com/images/g/btkAAOSwDyVkJqBR/s-l500.jpg, https://i.ebayimg.com/images/g/21wAAOSwSlFkJqBR/s-l500.jpg'
    ),
    (
        'Razer Nommo 2.0 PC Gaming Speakers',
        3,
        4999,
        'Electronics',
        'Razer Nommo 2.0 PC Gaming Speakers - Black - only used a couple of times',
        'https://i.ebayimg.com/images/g/HSgAAOSw-HNkHyOJ/s-l500.jpg',
        'https://i.ebayimg.com/images/g/65wAAOSw4J1kHyOI/s-l500.jpg, https://i.ebayimg.com/images/g/G-oAAOSw-iRkHyOI/s-l500.jpg, https://i.ebayimg.com/images/g/7pEAAOSw4EVkHyOJ/s-l500.jpg'
    ),
    (
        'Henry Hoover Microfibre Screen Cleaner',
        3,
        4999,
        'Electronics',
        'Henry Hoover Microfibre Screen Cleaner - Novelty Desk Accessory. Designed to keep electronic devices clean. ',
        'https://i.ebayimg.com/images/g/aLoAAOSwtWRjd611/s-l500.jpg',
        'https://i.ebayimg.com/images/g/huUAAOSwGLRjd62S/s-l500.jpg, https://i.ebayimg.com/images/g/YEEAAOSwqRJjd62h/s-l500.jpg, https://i.ebayimg.com/images/g/QSIAAOSw1lZjd62p/s-l500.jpg'
    ),
    (
        'Lenovo Thinkcentre M720q Tiny PC- i3 8th gen',
        5,
        12000,
        'Electronics',
        'Lenovo Thinkcentre M720q Tiny PC- i3 8th gen. In excellent condition.  Please check the specs section for all the technical details.',
        'https://i.ebayimg.com/images/g/HAIAAOSwiUtkJp0I/s-l500.jpg',
        'https://i.ebayimg.com/images/g/G74AAOSw2ClkJp0J/s-l500.jpg, https://i.ebayimg.com/images/g/WSUAAOSwLulkJp0K/s-l500.jpg, https://i.ebayimg.com/images/g/Tx4AAOSwfc1kJp0L/s-l500.jpg'
    ),
    (
        'Retro PC - Time computer - Windows ME - DOS - Retro Games',
        5,
        2500,
        'Electronics',
        'Retro PC - Time computer - Windows ME - DOS - Retro Games',
        'https://i.ebayimg.com/images/g/rjQAAOSwGh5kIHlu/s-l500.jpg',
        'https://i.ebayimg.com/images/g/Uk8AAOSwUj5kIHlv/s-l500.jpg, https://i.ebayimg.com/images/g/VlgAAOSw5jhkIHlu/s-l500.jpg, https://i.ebayimg.com/images/g/cMQAAOSwRfhkIJP2/s-l500.jpg'
    ),
    (
        'Intel I3/I5/I7 Ryzen 5/7/9 Nvidia GTX/RTX AMD RX',
        4,
        30000,
        'Electronics',
        'Pc Gaming Intel I3/I5/I7 Ryzen 5/7/9 Nvidia Gtx/Rtx Amd Rx Ram 8/16/32/64 Gb.Fortnite/Warzone/Gta5/Hogwarts Legacy/Rdr2',
        'https://i.ebayimg.com/images/g/oI0AAOSwoolkDSIH/s-l500.jpg',
        'https://i.ebayimg.com/images/g/C5sAAOSwcPhkDSGC/s-l500.jpg, https://i.ebayimg.com/images/g/G5EAAOSwsrFkDSIJ/s-l500.jpg, https://i.ebayimg.com/images/g/AKcAAOSwaAxkDSIK/s-l500.jpg'
    ),
    (
        'King size bed with M&S Pocket Sprung 1250',
        2,
        3500,
        'Furniture',
        'In good condition. There is a water mark on the headboard and the mattress has a part of the cover missing but this has not been an issue for the function of the bed. There are photos on the advert so you can see.',
        'https://i.ebayimg.com/images/g/5ysAAOSw3Vxj333M/s-l500.jpg',
        'https://i.ebayimg.com/images/g/3W8AAOSwbPlj333H/s-l500.jpg, https://i.ebayimg.com/images/g/3uUAAOSwCrpj333K/s-l500.jpg, https://i.ebayimg.com/images/g/tsgAAOSwnyFj333L/s-l500.jpg'
    ),
    (
        'Stua Wingback Chairs, Set of 2 Chairs',
        3,
        1200,
        'Furniture',
        'Old, used marked, some scratches, please see photos. no rust or corrosion on chrome.',
        'https://i.ebayimg.com/images/g/OxMAAOSwe-BkHYAZ/s-l500.jpg',
        'https://i.ebayimg.com/images/g/ksoAAOSwQUBkHYAa/s-l500.jpg, https://i.ebayimg.com/images/g/VYgAAOSwWxZkHYAc/s-l500.jpg, https://i.ebayimg.com/images/g/BGMAAOSwbhNkHYAd/s-l500.jpg'
    ),
    (
        'Ikea Poang Chair',
        4,
        2499,
        'Furniture',
        'Ikea Poang Chair. Dark grey fabric, excellent condition, barely used in a house with NO pets or children :-)',
        'https://i.ebayimg.com/images/g/JcQAAOSw00VkHcfV/s-l500.jpg',
        'https://i.ebayimg.com/images/g/XEQAAOSwyBhkHcfX/s-l500.jpg, https://i.ebayimg.com/images/g/IsMAAOSwkXJkHcfZ/s-l500.jpg, https://i.ebayimg.com/images/g/V9wAAOSw7ntkHcfa/s-l500.jpg'
    ),
    (
        'IKEA Hemnes Chest of 8 drawers in off-white',
        3,
        3200,
        'Furniture',
        'This unit is in pretty good used condition as can be seen in the photos, with no major scratches, gouges or dents.',
        'https://i.ebayimg.com/images/g/1VsAAOSwpT9kJXWx/s-l500.jpg',
        'https://i.ebayimg.com/images/g/CL4AAOSwZKlkJXWz/s-l500.jpg, https://i.ebayimg.com/images/g/zuoAAOSw0AhkJXW0/s-l500.jpg, https://i.ebayimg.com/images/g/npMAAOSwl41kJXW1/s-l500.jpg'
    ),
    (
        'Vi Spring king uk sized De Luxe divan base with 2 drawers',
        5,
        3999,
        'Furniture',
        'Vi Spring king sized De Luxe divan base with 2 drawers, cream, free headboard.',
        'https://i.ebayimg.com/images/g/YWQAAOSw2A5kHXh9/s-l500.jpg',
        'https://i.ebayimg.com/images/g/8LAAAOSw6jlkHXXo/s-l500.jpg, https://i.ebayimg.com/images/g/wlMAAOSwSPRkHXYR/s-l500.jpg, https://i.ebayimg.com/images/g/lUAAAOSwvd5kHXYl/s-l500.jpg'
    ),
    (
        'Solid Wood Double Bed 4ft 6in',
        5,
        4599,
        'Furniture',
        'Solid Wood 4ft 6ins Double Bed purchased originally from John Lewis Complete With a Sprung Mattress by Ralyon.',
        'https://i.ebayimg.com/images/g/EUcAAOSw2EJkJccD/s-l500.jpg',
        'https://i.ebayimg.com/images/g/atMAAOSw3ndkJccD/s-l500.jpg, https://i.ebayimg.com/images/g/soUAAOSwGx9kJccE/s-l500.jpg, https://i.ebayimg.com/images/g/saQAAOSwXkZkJccD/s-l500.jpg'
    ),
    (
        'Single bed with storage drawer',
        4,
        1699,
        'Furniture',
        'The Jango Single Bed is strong, simple and timeless, making it perfect for looking after little ones and teenagers.',
        'https://i.ebayimg.com/images/g/MbcAAOSwML1kHt9t/s-l500.jpg',
        'https://i.ebayimg.com/images/g/E0EAAOSwgxxkHt9u/s-l500.jpg, https://i.ebayimg.com/images/g/cYAAAOSw8yJkHt9w/s-l500.jpg, https://i.ebayimg.com/images/g/ZVAAAOSw1V9kHt9v/s-l500.jpg'
    ),
    (
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather',
        3,
        1275,
        'Pet Supplies',
        'Winter Dog Coat Jacket Dog Apparel for Cold Weather Windproof Black medium.',
        'https://i.ebayimg.com/images/g/nPYAAOSw3w1kHan0/s-l500.jpg',
        'https://i.ebayimg.com/images/g/7UQAAOSw6d1kHan2/s-l500.jpg, https://i.ebayimg.com/images/g/X2QAAOSw6CdkHan3/s-l500.jpg, https://i.ebayimg.com/images/g/nPwAAOSw3w1kHan4/s-l500.jpg'
    );