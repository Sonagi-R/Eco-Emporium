const signOutBtn = document.querySelector("#sign-out-btn")

const signOut = async () => {
  const res = await fetch(`https://localhost:8080/auth/logout`, { credentials: "include" });

  if (res.ok) {
    console.log("Successfuly logged out!");
    window.location.assign("/");
  } else {
    console.log("Something failed, very sad! :(");
  }
};

signOutBtn.addEventListener("click", async (e) => {
  e.preventDefault();

  await signOut();
});
