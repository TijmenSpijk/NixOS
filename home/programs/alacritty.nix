{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.dynamic_padding = true;
      window.padding = {
        x = 5;
        y = 5;
      };
      scrolling.history = 10000;

      font = {
        normal.family = "monospace";
        bold.family = "monospace";
        italic.family = "monospace";
        size = 12;
      };

    };
  };
}
