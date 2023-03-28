const getUser = async () => {
  
  const res = await fetch(`https://localhost:8080/auth/user`, { credentials: "include" });

  console.log(await res.json())

  if (res.ok) {
    console.log("Successfuly got user!");
  } else {
    console.log("Something failed, very sad! :(");
  }
};

getUser()