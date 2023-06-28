{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	# Networking
	networking.hostName = "desktop";
	networking.wireless.enable = false;
	networking.networkmanager.enable = true;

	# Video Drivers
}
