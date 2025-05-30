{ config, pkgs, ... }:

let
  programs = import ./home/programs.nix { inherit config pkgs; };
in {
  home.username = "midas";
  home.homeDirectory = "/home/midas";
  home.stateVersion = "23.11"; # DON'T ERRASE

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    SHELL = "zsh";
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.packages = [];

  home.file = {};

  # Programas
  programs.kitty = programs.kitty;
  programs.zsh = programs.zsh;
  programs.git = programs.git;
  programs.fzf = programs.fzf;
  programs.neovim = programs.neovim;
  wayland.windowManager.hyprland = programs.hyprland;
  programs.starship = programs.starship;

  programs.home-manager.enable = true;
}
