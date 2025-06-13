# modules/nixos/users.nix
{ pkgs, ... }:
{
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
}