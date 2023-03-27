DROP TABLE IF EXISTS items;

CREATE TABLE items(
    item_id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    description VARCHAR(255),
    image_url VARCHAR(255),
    user_id INT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (item_id)
);

INSERT INTO items(name, price, description,image_url)
VALUES
    ('Laptop Backpack', 8015, 'This sleek and durable laptop backpack features multiple compartments and a padded sleeve to keep your laptop safe and secure.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXsKib2hN1Hhm0nk-GLbP4CHna7WSyziaYEA&usqp=CAU'),
    ('Wireless Bluetooth Speaker', 7000, 'Experience high-quality sound and portability with this wireless Bluetooth speaker. It''s waterproof and has a long battery life.', 'https://cdn.shopify.com/s/files/1/0503/4170/7969/products/xdobo2_700x700.jpg?v=1671229502'),
    ('Smartphone Gimbal Stabilizer', 12030, 'Capture professional-grade videos with this smartphone gimbal stabilizer. It''s easy to use and has multiple modes for different shooting scenarios.', 'https://www.omnicoreagency.com/wp-content/uploads/2020/01/Zhiyun-Smooth-Q2-3-Axis-Handheld-Smartphone-Gimbal-Stabilizer-Table.jpg'),
    ('Leather Wallet', 5050, 'Keep your cash and cards organized with this stylish leather wallet. It has multiple compartments and a secure zippered closure.', 'https://revaayat.co.uk/wp-content/uploads/2021/05/GIX043.png'),
    ('Electric Toothbrush', 9000, 'Achieve a brighter, healthier smile with this electric toothbrush. It has multiple settings and a timer to ensure thorough cleaning.', 'https://growingsmiles.co.uk/wp-content/uploads/SURI-cover.png'),
    ('Travel Pillow', 2510, 'Get a comfortable and restful sleep while traveling with this travel pillow. It''s lightweight and compact, making it easy to carry.', 'https://asset1.cxnmarksandspencer.com/is/image/mands/Memory-Foam-Travel-Pillow-1/PL_05_T40_8413L_T0_X_EC_0?$PDP_IMAGEGRID_1_LG$'),
    ('Vintage Leather Bag', 12005, 'Handcrafted from high-quality leather, this vintage-style bag features multiple compartments and a sturdy strap for comfortable wear.', 'https://i.ebayimg.com/images/g/zcYAAOSw4OFd5jFH/s-l500.jpg'),
    ('Designer Sunglasses', 18040, 'Make a fashion statement with these stylish sunglasses from a top designer brand. The frames are made from durable materials and the lenses provide 100% UV protection.', 'https://www.internetspecs.co.uk/user/products/large/radley-rayanna-designer-sunglasses-107.jpg'),
    ('Wireless Headphones', 10060, 'Experience crystal-clear sound and freedom of movement with these wireless headphones. They have a long battery life and are compatible with a range of devices.', 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MXJ92?wid=2104&hei=2980&fmt=jpeg&qlt=95&.v=1580420175341'),
    ('Eco-Friendly Water Bottle', 2570, 'Reduce your environmental footprint with this eco-friendly water bottle made from recycled materials. It''s durable, leak-proof, and easy to carry.', 'https://cdn.shopify.com/s/files/1/0957/0496/products/black-blum-glass-water-bottle-olive-600ml-378961_1000x.jpg?v=1660560895');