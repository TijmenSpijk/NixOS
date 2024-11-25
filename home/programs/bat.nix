{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      style = "header,header-filesize,grid,rule";
      paging = "never";
    };
  };
}
