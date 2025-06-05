{ config, pkgs, ... }:

{
  home.username = "midas";
  home.homeDirectory = "/home/midas";

  home.stateVersion = "25.05"; # Don't errase

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
