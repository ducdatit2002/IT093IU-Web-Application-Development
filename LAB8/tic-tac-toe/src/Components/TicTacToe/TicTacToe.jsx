import React, { useRef, useState } from "react";
import "./TicTacToe.css";
import circle_icon from "../Assets/circle.png";
import cross_icon from "../Assets/cross.png";

const TicTacToe = () => {
  const [count, setCount] = useState(0);
  const [lock, setLock] = useState(false);
  const [data, setData] = useState(["", "", "", "", "", "", "", "", ""]);
  const titleRef = useRef(null);

  const toggle = (num) => {
    if (lock || data[num] !== "") {
      return;
    }

    const newData = [...data];
    newData[num] = count % 2 === 0 ? "X" : "O";
    setData(newData);
    setCount(count + 1);
    checkWin(newData);
  };

  const checkWin = (newData) => {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (const combination of winningCombinations) {
      const [a, b, c] = combination;
      if (newData[a] && newData[a] === newData[b] && newData[a] === newData[c]) {
        won(newData[a]);
        return;
      }
    }
  };

  const won = (winner) => {
    setLock(true);
    if (winner === "X") {
      titleRef.current.innerHTML = `Congratulations: <img src="${cross_icon}" alt="X" />`;
    } else {
      titleRef.current.innerHTML = `Congratulations: <img src="${circle_icon}" alt="O" />`;
    }
  };

  const reset = () => {
    setLock(false);
    setData(["", "", "", "", "", "", "", "", ""]);
    setCount(0);
    titleRef.current.innerHTML = 'Tic Tac Toe Game Design by<span>Duc Dat</span>';
  };

  return (
    <div className="container">
      <h1 className="title" ref={titleRef}>
        Tic Tac Toe Game Design by<span>Duc Dat</span>
      </h1>
      <div className="board">
        {[0, 1, 2, 3, 4, 5, 6, 7, 8].map((num) => (
          <div
            key={num}
            className="boxes"
            onClick={() => toggle(num)}
          >
            {data[num] && <img src={data[num] === "X" ? cross_icon : circle_icon} alt={data[num]} />}
          </div>
        ))}
      </div>
      <button className="reset" onClick={reset}>Reset</button>
    </div>
  );
};

export default TicTacToe;
