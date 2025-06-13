{
  pkgs,
  lib,
  ...
  }: {
  imports = [
    ./hyprland/default.nix
    ./kitty/default.nix
  ];

  hyprland.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
