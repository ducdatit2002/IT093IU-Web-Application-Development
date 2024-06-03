import {Routes, Route, Link} from 'react-router-dom';
import React, { useEffect, useState } from "react";

import Home from '../pages/Home';
import "./Navbar.css";
function Navbar() {
  const [loggedIn, setLoggedIn] = useState(true);

  useEffect(() => {
    setLoggedIn(localStorage.getItem("loggedIn"));
  }, [loggedIn]);

  return (
    <div className="Navbar">
      <Link to="/home">Home</Link>
      <Routes>
        <Route path="/home" element={<Home/>}>Home</Route>
      </Routes>
    </div>
  );
}

export default Navbar;
