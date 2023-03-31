const signInBtn = document.querySelector("#sign-in-btn");
const signUpBtn = document.querySelector("#sign-up-btn");
const formCover = document.querySelector("#form-cover");
const signInForm = document.querySelector("#sign-in-form");
const signUpForm = document.querySelector("#sign-up-form");
const errorText = document.querySelector("#errorText");

// toggle forms
signUpBtn.addEventListener("click", () => {
  formCover.classList.add("active");
  signInForm.reset();
});

signInBtn.addEventListener("click", () => {
  formCover.classList.remove("active");
  signUpForm.reset();
});

// login
const logIn = async (data) => {
  const options = {
    method: "POST",
    credentials: "include",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  };

  const res = await fetch(`https://localhost:8080/auth/login`, options);

  const { user } = await res.json();

  if (res.ok) {
    console.log(`Successfully logged in: ${user.username}`);
    localStorage.setItem("user", JSON.stringify(user));
    localStorage.setItem("username", JSON.stringify(user.username));
    localStorage.setItem("user_id", JSON.stringify(user.user_id));
    window.location.assign("main.html");
  } else {
    console.log("Something failed, very sad! :(");
    showErrorText("Your email and password do not match. Please try again.");
  }
};

signInForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  const data = getFormData(".sign-in-input");
  await logIn(data);
  signInForm.reset();
});

// sign up
const signUp = async (data) => {
  const options = {
    method: "POST",
    credentials: "include",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  };

  const res = await fetch(`https://localhost:8080/auth/register`, options);

  if (res.ok) {
    console.log(`Successfully signed up: ${data.username}`);
    window.location.assign("/");
  } else {
    console.log("Something failed, very sad! :(");
  }
};

signUpForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  const data = getFormData(".sign-up-input");

  if (data.password === data.conPassword && validateEmail(data.email)) {
    await signUp(data);
    signUpForm.reset();
  } else {
    showErrorText("Your email and password do not match. Please try again.");
  }
});

function getFormData(selector) {
  const formData = {};
  const inputs = document.querySelectorAll(selector);
  inputs.forEach((input) => (formData[input.name] = input.value));
  return formData;
}

function validateEmail(email) {
  const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  return mailformat.test(email);
}

function showErrorText(message) {
  errorText.textContent = message;
  setTimeout(() => (errorText.textContent = ""), 5000);
}