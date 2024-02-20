import React from "react";
import mount from "../mount";
import { newUserSessionPath } from "../generated/routes";

type Props = {
  message: string;
}

const Sample: React.FC<Props> = ({ message }) => {
  const handleClick = () => {
    // 画面を移動する
    window.location.href = newUserSessionPath();
  };
  return (
    <button onClick={handleClick} type="button" className="btn btn-primary">
      ログイン
      hoge
      <strong>{message}</strong>
    </button>
  );
};

mount({
  Sample,
});

