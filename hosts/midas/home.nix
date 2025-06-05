{ config, pkgs, ... }:

{
  home.username = "midas";
  home.homeDirectory = "/home/midas";

  home.stateVersion = "25.05"; # Don't errase

  hyprland.enable = true;

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
