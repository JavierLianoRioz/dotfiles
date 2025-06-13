# modules/nixos/default.nix
{
  imports = [
    ./boot.nix
    ./network.nix
    ./localization.nix
    ./services.nix
    ./users.nix
    ./programs.nix
    ./packages.nix
    ./nix.nix
  ];
}
