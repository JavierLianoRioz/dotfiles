# modules/nixos/nix.nix
{
  # Características experimentales de Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}