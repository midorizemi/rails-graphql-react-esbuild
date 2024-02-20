import React from "react";
import mount from "../mount";
// import { topIndexPath } from "../generated/routes";

type Props = {
  message: string;
}

const Sample: React.FC<Props> = ({ message }) => {
  const handleClick = () => {
    console.debug("ログインボタンがクリックされました");
    // 画面を移動する
    // window.location.href = topIndexPath();
  };
  return (
    <button onClick={handleClick} type="button" className="rounded-lg border border-primary-500 bg-primary-500 px-5 py-2.5 text-center text-sm font-medium text-white shadow-sm transition-all hover:border-primary-700 hover:bg-primary-700 focus:ring focus:ring-primary-200 disabled:cursor-not-allowed disabled:border-primary-300 disabled:bg-primary-300">
      ログイン
    </button>
  );
};

mount({
  Sample,
});

