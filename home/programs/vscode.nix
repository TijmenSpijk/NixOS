{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      streetsidesoftware-code-spell-checker
    ];
  };
}
