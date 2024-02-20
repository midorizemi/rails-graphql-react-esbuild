import React from "react";
import mount from "../mount";
import { dashboardPath } from "../generated/routes";

type Props = {
  message: string;
};
const App: React.FC<Props> = ({ message }) => {
  return (
    <>
      <h1> <strong>{message.toUpperCase()}</strong> Hello from React!</h1>
      <a href={dashboardPath()} className="btn btn-secondary">ダッシュボードへ</a>
    </>
  );
};

mount({
  App,
});
