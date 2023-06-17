# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-f9db11c0-1825-4c22-86fc-e371211ec03f".device = "/dev/disk/by-uuid/f9db11c0-1825-4c22-86fc-e371211ec03f";
  boot.initrd.luks.devices."luks-f9db11c0-1825-4c22-86fc-e371211ec03f".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true;

  # Enable networking
  # networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
	enable = true;
    	layout = "us";
	windowManager.bspwm.enable = true;
	displayManager = {
		lightdm.enable = true;
		autoLogin.enable = true;
		autoLogin.user = "tijmen";
	};	
  };

  programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
  };

  services.picom.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tijmen = {
    isNormalUser = true;
    description = "tijmen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    bspwm
    cargo
    dmenu
    dunst
    eww
    exa
    firefox
    fish
    flameshot
    fontconfig
    git
    lxappearance
    lxsession
    mangohud
    neovim
    nitrogen
    pavucontrol
    picom
    polkit_gnome
    polybar
    starship
    steam
    steam-run
    sxhkd
    ranger
    rofi
    rustc
    tldr
    trash-cli
    vim
    vscodium
    xclip
    xfce.thunar
    xdg-utils
    xorg.xinit
  ];

  fonts = {
	
	fonts = with pkgs; [
		(nerdfonts.override { fonts = [ "Meslo" ]; })
	];
	
	fontconfig = {
		defaultFonts = {
			monospace = [ "Meslo LG L Regular Nerd Font Complete Mono" ];
		};
	};
  };	
  
  # Polkit
  security.polkit.enable = true;
  systemd = {
	user.services.polkit-gnome-authentication-agent-1 = {
		description = "polkit-gnome-authentication-agent-1";
		wantedBy = [ "graphical-session.target" ];
		wants = [ "graphical-session.target" ];
		after = [ "graphical-session.target" ];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		}; 		
  	}; 
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
