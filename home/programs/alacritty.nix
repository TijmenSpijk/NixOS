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

			colors = {
				primary = {
					foreground = "#eceff4";
					background = "#2e3440";
				};

				normal = {
					black = "#3b4252";
					red = "#bf616a";
					orange = "#d08770";
					yellow = "#ebcb8b";
					green = "#a3be8c";
					blue = "#5e81ac";
					magenta = "#b48ead";
					cyan = "#88c0d0";
					white = "#e5e9f0";
				};
				
				bright = {
					black = "#434c5e";
					red = "#bf616a";
					orange = "#d08770";
					yellow = "#ebcb8b";
					green = "#a3be8c";
					blue = "#5e81ac";
					magenta = "#b48ead";
					cyan = "#88c0d0";
					white = "#eceff4";
				};		

				dim = {
					black = "#2e3440";
					red = "#bf616a";
					orange = "#d08770";
					yellow = "#ebcb8b";
					green = "#a3be8c";
					blue = "#5e81ac";
					magenta = "#b48ead";
					cyan = "#88c0d0";
					white = "#d8dee9";
				};
			};
		};
  	};
}
