DROP TABLE IF EXISTS items;

CREATE TABLE items(
    item_id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    details VARCHAR(255),
    PRIMARY KEY (item_id)
);

INSERT INTO items(name, price, details)
VALUES
    ("Laptop Backpack", 8015, "This sleek and durable laptop backpack features multiple compartments and a padded sleeve to keep your laptop safe and secure."),
    ("Wireless Bluetooth Speaker", 7000, "Experience high-quality sound and portability with this wireless Bluetooth speaker. It's waterproof and has a long battery life."),
    ("Smartphone Gimbal Stabilizer", 12030, "Capture professional-grade videos with this smartphone gimbal stabilizer. It's easy to use and has multiple modes for different shooting scenarios."),
    ("Leather Wallet", 5050, "Keep your cash and cards organized with this stylish leather wallet. It has multiple compartments and a secure zippered closure."),
    ("Electric Toothbrush", 9000, "Achieve a brighter, healthier smile with this electric toothbrush. It has multiple settings and a timer to ensure thorough cleaning."),
    ("Travel Pillow", 2510, "Get a comfortable and restful sleep while traveling with this travel pillow. It's lightweight and compact, making it easy to carry."),
    ("Vintage Leather Bag", 12005, "Handcrafted from high-quality leather, this vintage-style bag features multiple compartments and a sturdy strap for comfortable wear."),
    ("Designer Sunglasses", 18040, "Make a fashion statement with these stylish sunglasses from a top designer brand. The frames are made from durable materials and the lenses provide 100% UV protection."),
    ("Wireless Headphones", 10060, "Experience crystal-clear sound and freedom of movement with these wireless headphones. They have a long battery life and are compatible with a range of devices."),
    ("Eco-Friendly Water Bottle", 2570, "Reduce your environmental footprint with this eco-friendly water bottle made from recycled materials. It's durable, leak-proof, and easy to carry.");