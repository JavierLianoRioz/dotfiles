{ pkgs, inputs, ... }:
let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Red
  networking = {
    hostName = "tower";
    networkmanager.enable = true;
  };

  # Localización
  time.timeZone = "Europe/Madrid";
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocaleSettings = {
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
  };

  # Servicios
  services = {
    # Display manager SDDM con tema personalizado
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
        custom-sddm-astronaut
      ];
      settings.Theme.Current = "sddm-astronaut-theme";
    };

    # Teclado español
    xserver.xkb.layout = "es";
    console.keyMap = "es";

    # Impresión y audio
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  # Usuario
  users.users.midas = {
    isNormalUser = true;
    description = "midas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  # Programas
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    hyprland.enable = true;
  };

  # Configuración de paquetes
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    with pkgs;
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

  # Características experimentales de Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05"; # NO CAMBIAR
}
