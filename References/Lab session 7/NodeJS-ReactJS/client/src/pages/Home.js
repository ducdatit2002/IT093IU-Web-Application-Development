import React from "react";
import Navbar from "../components/Navbar.js";
import Axios from "axios";
import "./Home.css";
import { useEffect } from "react";

const studentID = localStorage.getItem("id");

function Home() {
  const [input, setInputValue] = React.useState(false)
  const [data, setData] = React.useState([]);
  const [course, setCourse] = React.useState([]);

  //get all registered courses for the user
  const id = localStorage.getItem("id")
  useEffect(() => {
    Axios.get(`http://localhost:3001/user/${id}`, {
      params: {
        id: localStorage.getItem("id"),
      },
    })
      .then((res) => {
        setData(res.data.result);
        setCourse(res.data.result2);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

 

  //register every course that is checked
  const registerCourse = () => {

    setInputValue(!input);

    const checked = document.querySelectorAll("input:checked");
    checked.forEach((item) => {
      Axios.post(`http://localhost:3001/user/${id}/registerCourse`, {
        id: studentID,
        courseID: item.value,
      })
        .then((res) => {
          console.log(res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    });
  };

  return (
    <div className="app">
      <Navbar />
      <br />
      <br />
      <div className="Home">
        <div className="header-content">
          <h1>Reactjs - Nodejs || Lab 7 || WAD</h1>
          <h4>You are logged in as <em>{localStorage.getItem("username")}</em></h4>
          <h3>
            You have <u>registered</u> for the following courses:
            <br />
          </h3>
        </div>

        <table>
          <tbody>
            <tr>
              <th>Course ID</th>
              <th>Course Name</th>
              <th>Credits</th>
            </tr>
            {data.map((item) => (
              <tr>
                <td>{item.c_ID}</td>
                <td>{item.c_name}</td>
                <td>{item.c_credit}</td>
              </tr>
            ))}
          </tbody>
        </table>

        <br />
        <hr />
        <div className="header-content">
          <h3>
            You can <u>register</u> for the following courses:
          </h3>
        </div>
        
      <form>
        <table>
          <tbody>
            <tr>
              <th>x</th>
              <th>Course ID</th>
              <th>Course Name</th>
              <th>Credits</th>
            </tr>
            {course.map((item) => (
                <tr>
                  <td>
                    {" "}
                    <input type="checkbox" value={item.c_ID}  />{" "}
                  </td>
                  <td>{item.c_ID}</td>
                  <td>{item.c_name}</td>
                  <td>{item.c_credit}</td>
                </tr>
              ))}
          </tbody>
        </table>
        <br />
        <button className="submit" onClick={registerCourse} checked={input}>
          Register
        </button>
        <button className="reset" type="reset">
          {" "}
          Cancel
        </button>
      </form>
      </div>
    </div>
  );
}

export default Home;
