{ config, pkgs, ... }:

{
  home.username = "midas";
  home.homeDirectory = "/home/midas";
  home.stateVersion = "23.11"; # DON'T ERRASE

    home.sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      SHELL = "zsh";
    };

  imports = [
    ./modules/kitty.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/fzf.nix
    ./modules/neovim/neovim.nix
    ./modules/starship.nix
    ./modules/window_managers/hyprland.nix
  ];

  kitty.enable = true;
  zsh.enable = true;
  git.enable = true;
  fzf.enable = true;
  neovim.enable = true;
  starship.enable = true;
  hyprland.enable = true;

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.packages = [];

  home.file = {};

# Programas
  programs.zoxide.enable = true;

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
