const item_name = document.querySelector('#item-name-input');
const item_category = document.querySelectorAll('#category-input');
const item_price = document.querySelector('#item-price-input');
const item_description = document.querySelector('#description-input');
const item_image_url = document.querySelector('#main-image-input');
const item_add_imgs = document.querySelectorAll('#additional-images-input');

const submit = document.querySelector('.form-container')

submit.addEventListener('submit', async (e) => {
    e.preventDefault();
    const data = getFormData();
    await addListing(data);
})

function getFormData() {
    const formData = {};
    const img = document.querySelector(".listing-img");
    const addImg = document.querySelectorAll(".listing-add-img");
    const inputs = document.querySelectorAll(".listing-input");
    const textarea = document.querySelector(".listing-text-area");
    const select = document.querySelector(".listing-select");
    inputs.forEach((input) => (formData[input.name] = input.value));
    formData["additional_imgs"] = ""
    addImg.forEach((img, index) => {
      formData[img.name] += img.value
      if (index !== addImg.length - 1) {
        formData[img.name] += ', ';
      }
    });
    formData["user_id"] = localStorage.getItem('user_id')
    formData[img.name] = img.value
    formData[textarea.name] = textarea.value
    formData[select .name] = select.textContent
    return formData;
  }

const addListing = async (data) => {
    const options = {
    method: "POST",
    credentials: "include",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
    };
  
    const res = await fetch(`https://localhost:8080/items`, options);

    if (res.ok) {
        console.log('created')
      window.location.assign("main.html");
    } else {
      console.log("Something failed, very sad! :(");
    }
  };

    
