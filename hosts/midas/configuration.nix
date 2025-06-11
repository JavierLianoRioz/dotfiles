# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ 
pkgs, 
inputs,
... 
}:

let 
custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tower"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  
  # Enable hyprland
  programs.hyprland.enable = true;

services.displayManager.sddm = {
       enable = true;
       wayland = {
         enable = true;
       };
       package = pkgs.kdePackages.sddm;
       extraPackages = with pkgs; [
         kdePackages.qtsvg
         kdePackages.qtmultimedia
         kdePackages.qtvirtualkeyboard
	 custom-sddm-astronaut
       ];
       theme = "sddm-astronaut-theme";
       settings = {
		Theme = {
			Current = "sddm-astronaut-theme";
		};
       };
    };

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
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs;
  [
    kitty
    git
    home-manager
    custom-sddm-astronaut
    lazygit
  ]
  ++ [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.nixvim.packages.${pkgs.system}.default
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # DON'T CHANGE

}
