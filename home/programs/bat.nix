{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
      style = "header,header-filesize,grid,rule";
      paging = "never";
    };
  };
}
