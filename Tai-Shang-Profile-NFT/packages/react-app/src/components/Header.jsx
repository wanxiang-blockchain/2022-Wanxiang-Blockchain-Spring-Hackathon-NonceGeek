import { PageHeader } from "antd";
import React from "react";

// displays a page header

export default function Header() {
  return (
    <a href="https://github.com/WeLightProject/Tai-Shang-Profile-NFT" target="_blank" rel="noopener noreferrer">
      <PageHeader
        title="Tai-Shang-Profile-NFT"
        subTitle="Register profile!"
        style={{ cursor: "pointer" }}
      />
    </a>
  );
}
