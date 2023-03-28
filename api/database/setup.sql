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
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    image_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    PRIMARY KEY (item_id)
);

INSERT INTO
    items(name, user_id, price, category, description, image_url)
VALUES
    (
        'Laptop Backpack',
        1,
        8015,
        'Clothes',
        'This sleek and durable laptop backpack features multiple compartments and a padded sleeve to keep your laptop safe and secure.',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXsKib2hN1Hhm0nk-GLbP4CHna7WSyziaYEA&usqp=CAU'
    ),
    (
        'Wireless Bluetooth Speaker',
        1,
        7000,
        'Electronics',
        'Experience high-quality sound and portability with this wireless Bluetooth speaker. It''s waterproof and has a long battery life.',
        'https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502'
    ),
    (
        'Smartphone Gimbal Stabilizer',
        1,
        12030,
        'Electronics',
        'Capture professional-grade videos with this smartphone gimbal stabilizer. It''s easy to use and has multiple modes for different shooting scenarios.',
        'https://www.omnicoreagency.com/wp-content/uploads/2020/01/Zhiyun-Smooth-Q2-3-Axis-Handheld-Smartphone-Gimbal-Stabilizer-Table.jpg'
    ),
    (
        'Leather Wallet',
        1,
        5050,
        'clothes',
        'Keep your cash and cards organized with this stylish leather wallet. It has multiple compartments and a secure zippered closure.',
        'https://revaayat.co.uk/wp-content/uploads/2021/05/GIX043.png'
    ),
    (
        'Electric Toothbrush',
        1,
        9000,
        'Electronics',
        'Achieve a brighter, healthier smile with this electric toothbrush. It has multiple settings and a timer to ensure thorough cleaning.',
        'https://growingsmiles.co.uk/wp-content/uploads/SURI-cover.png'
    ),
    (
        'Travel Pillow',
        1,
        2510,
        'Outdoor & Garden',
        'Get a comfortable and restful sleep while traveling with this travel pillow. It''s lightweight and compact, making it easy to carry.',
        'https://asset1.cxnmarksandspencer.com/is/image/mands/Memory-Foam-Travel-Pillow-1/PL_05_T40_8413L_T0_X_EC_0?$PDP_IMAGEGRID_1_LG$'
    ),
    (
        'Vintage Leather Bag',
        1,
        12005,
        'Clothes',
        'Handcrafted from high-quality leather, this vintage-style bag features multiple compartments and a sturdy strap for comfortable wear.',
        'https://i.ebayimg.com/images/g/zcYAAOSw4OFd5jFH/s-l500.jpg'
    ),
    (
        'Designer Sunglasses',
        1,
        18040,
        'Clothes',
        'Make a fashion statement with these stylish sunglasses from a top designer brand. The frames are made from durable materials and the lenses provide 100% UV protection.',
        'https://www.internetspecs.co.uk/user/products/large/radley-rayanna-designer-sunglasses-107.jpg'
    ),
    (
        'Wireless Headphones',
        1,
        10060,
        'Electronics',
        'Experience crystal-clear sound and freedom of movement with these wireless headphones. They have a long battery life and are compatible with a range of devices.',
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MXJ92?wid=2104&hei=2980&fmt=jpeg&qlt=95&.v=1580420175341'
    ),
    (
        'Eco-Friendly Water Bottle',
        1,
        2570,
        'Sports & Recreation',
        'Reduce your environmental footprint with this eco-friendly water bottle made from recycled materials. It''s durable, leak-proof, and easy to carry.',
        'https://cdn.shopify.com/s/files/1/0957/0496/products/black-blum-glass-water-bottle-olive-600ml-378961_1000x.jpg?v=1660560895'
    );