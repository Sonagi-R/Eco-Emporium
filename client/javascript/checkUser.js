const checkUser = async () => {
  
  const res = await fetch(`https://localhost:8080/auth/check`, { credentials: "include" });

  if (res.ok) {
    console.log("You are allowed to be here!");
    if (window.location.pathname == "/") {
      window.location.assign("main.html");
    }
  } else {
    console.log("You should not be here!");
    if (window.location.pathname != "/") {
      window.location.assign("/");
    }
  }
};

checkUser()