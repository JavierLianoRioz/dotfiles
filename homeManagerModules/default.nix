{
  pkgs,
  lib,
  ...
  }: {
  imports = [
    ./hyprland.nix
    ./kitty
  ];

  hyprland.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
