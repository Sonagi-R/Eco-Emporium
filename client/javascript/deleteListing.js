const itemButton = document.querySelector(".item-buttons");

// Create a new observer object
const observer = new MutationObserver((mutations) => {
  mutations.forEach((mutation) => {
    mutation.addedNodes.forEach((node) => {
      if (node.id === "delete-btn") {
        const deleteBtn = document.querySelector("#delete-btn");
        deleteBtn.addEventListener("click", (e) => {
          deleteListing(e)
        })
      }
    });
  });
});

const config = { childList: true };
observer.observe(itemButton, config);

const deleteListing = async (e) => {
  const options = {
    method: "DELETE",
    credentials: "include",
    headers: { "Content-Type": "application/json" },
  };

  const currentImage = document.querySelector('#current-image');

  const res = await fetch(`https://localhost:8080/items/${currentImage.getAttribute("item_id")}`, options);

  if (res.ok) {
    console.log(`Deleted`);
    window.location.assign("main.html");
  } else {
    console.log("Something failed, very sad! :(");
  }
};