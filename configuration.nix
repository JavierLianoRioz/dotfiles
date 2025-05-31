
{ config, pkgs, inputs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
			inputs.home-manager.nixosModules.home-manager
		];

	fonts.packages = with pkgs; [ fira-code ];

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			midas = import ./home.nix;
		};
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

# NVidia
	hardware.graphics.enable = true;
	hardware.nvidia = {
		open = true;
		modesetting.enable = true;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.beta;
	};



	programs.hyprland.enable = true;

# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "tower";

# Enable networking
	networking.networkmanager.enable = true;

# Set your time zone.
	time.timeZone = "Europe/Madrid";

# Select internationalisation properties.
	i18n.defaultLocale = "es_ES.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "es_ES.UTF-8";
		LC_IDENTIFICATION = "es_ES.UTF-8";
		LC_MEASUREMENT = "es_ES.UTF-8";
		LC_MONETARY = "es_ES.UTF-8";
		LC_NAME = "es_ES.UTF-8";
		LC_NUMERIC = "es_ES.UTF-8";
		LC_PAPER = "es_ES.UTF-8";
		LC_TELEPHONE = "es_ES.UTF-8";
		LC_TIME = "es_ES.UTF-8";
	};

# Enable the X11 windowing system.
	services.xserver.enable = true;

# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

# Configure keymap
	services.xserver.xkb = {
		layout = "es";
		variant = "";
	};

	console.keyMap = "es";

# Enable CUPS to print documents.
	services.printing.enable = true;

# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.midas = {
		isNormalUser = true;
		description = "midas";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
#  thunderbird
		];
	};

# Install firefox.
	programs.firefox.enable = true;


# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
		home-manager
			kitty
			bat
			tree
			zig
			lsd
			home-manager
			lazygit
	];

	system.stateVersion = "25.05";

}
