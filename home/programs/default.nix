{config, pkgs, ...}: {
	imports = [
		./alacritty.nix
		./starship.nix
	];

	home.file.".config/fish/config.fish".source = ../../.config/config.fish;
}
