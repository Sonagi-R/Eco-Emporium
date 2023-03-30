const item_name = document.querySelector('#item-name-input');
const item_category = document.querySelectorAll('#category-input');
const item_price = document.querySelector('#item-price-input');
const item_description = document.querySelector('#description-input');
const item_image_url = document.querySelector('#main-image-input');
const item_add_imgs = document.querySelectorAll('#additional-images-input');

const submit = document.querySelector('.form-button')

submit.addEventListener('submit', () => {
    fetch("https://localhost:8080/items",{
        method: 'POST',
        headers: { 
            'Content-Type': 'application/json'
        },
        credentials: "include", 
        body: JSON.stringify({
            name: item_name,
            category: item_category,
            price: item_price,
            description: item_description,
            image_url: item_image_url,
            add_imgs: item_add_imgs

        })
    })

    .then((response) => response.json())
    .then((data) => console.log(data));

})




