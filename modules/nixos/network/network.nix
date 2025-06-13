# modules/nixos/network.nix
{
  # Red
  networking = {
    hostName = "tower";
    networkmanager.enable = true;
  };
}