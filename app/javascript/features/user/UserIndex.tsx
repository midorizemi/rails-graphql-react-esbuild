import React from "react";
import mount from "../../mount";
import { newUserSessionPath } from "../../generated/routes";

type Props = {
  message: string;
}

const UserIndex: React.FC<Props> = ({ message }) => {
  const handleClick = () => {
    // 画面を移動する
    window.location.href = newUserSessionPath();
  };
  // GraphQLクライアントを使ってユーザーの一覧を取得する
  return (
    <div>ユーザーの一覧を出す</div>
  );
};

mount({
  UserIndex,
});


