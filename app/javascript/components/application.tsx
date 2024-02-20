import React from "react";
import mount from "../mount";

interface Props {
  message: string;
}
const App: React.FC<Props> = ({ message }) => <h1> <strong>{message.toUpperCase()}</strong> Hello from React!</h1>;

mount({
  App,
});
