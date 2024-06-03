import React, { useState } from "react";
import Axios from "axios";

import './Login.css'

function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const [notice, setNotice] = useState("");

  const login = () => {
    Axios.post("http://localhost:3001/user/login", {
      username: username,
      password: password,
    })
      .then((res) => {
        console.log(res.data);
        if (res.data.status === "success") {
          localStorage.setItem("loggedIn", true);
          localStorage.setItem("id", username);
          localStorage.setItem("username", username);
          window.location.href = "/home";
        } else {
          setNotice(res.data.message);
          alert("Login fail");
        }
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <div className="app">
      <h1>Reactjs - Nodejs || LAB 7 | WAD</h1>
      <p>{notice}</p>
      <div className="login">
        <form>
          <label>Username:</label>
          <input
            type="text"
            name="username"
            placeholder="Username"
            onChange={(e) => {
              setUsername(e.target.value);
            }}
          />
          <br />
          <label>Password:</label>
          <input
            type="password"
            name="password"
            placeholder="Password"
            onChange={(e) => {
              setPassword(e.target.value);
            }}
          />
          <br />
          <button onClick={login}>Login</button>
        </form>
      </div>
    </div>
  );
}

export default Login;
