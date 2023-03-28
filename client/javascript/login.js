const signInBtn = document.querySelector("#sign-in-btn");
const signUpBtn = document.querySelector("#sign-up-btn");
const formCover = document.querySelector("#form-cover");
const signInForm = document.querySelector("#sign-in-form");
const signUpForm = document.querySelector("#sign-up-form");

const logIn = async (data) => {
  const options = {
    method: "POST",
    credentials: 'include',
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data)
  };

  console.log(options.body)

  const res = await fetch(`https://localhost:8080/auth/login`, options);

  if (res.ok) {
    console.log("Successfuly logged in:", data.username);
    localStorage.setItem("user", JSON.stringify(data.username))
    window.location.assign("main.html")
  } else {
    console.log("Something failed, very sad! :(")
  }
}

signUpBtn.addEventListener("click", () => {
  formCover.classList.add("active");
  signInForm.reset();
});

signInBtn.addEventListener("click", () => {
  formCover.classList.remove("active");
  signUpForm.reset();
});

const getLogFormData = () => {
  let formData = {};
  const inputs = document.querySelectorAll(".sign-in-input");
  inputs.forEach((input) => (formData[input.name] = input.value));

  return formData;
};

signInForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const data = getLogFormData();
  await logIn(data);
  signInForm.reset()
});
