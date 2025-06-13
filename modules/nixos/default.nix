# modules/nixos/default.nix
{
  imports = [
    ./system/boot.nix
    ./system/nix.nix
    ./network/network.nix
    ./localization/localization.nix
    ./users/users.nix
    ./programs/programs.nix
    ./packages/packages.nix
    ./services/services.nix
  ];
}
