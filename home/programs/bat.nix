{ config, pkgs, ... } : {
	programs.bat = {
		enable = true;
		config = {
			theme = "ansi";
			style = "header,header-filesize,grid,rule";
			paging = "never";
		};
	};
}
