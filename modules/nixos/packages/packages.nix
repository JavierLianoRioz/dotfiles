# modules/nixos/packages.nix
{ pkgs, inputs, ... }:
{
  # Configuración de paquetes
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
    with pkgs;
    [
      kitty
      git
      home-manager
      lazygit
      vscode
      pavucontrol
    ]
    ++ [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
      inputs.nixvim.packages.${pkgs.system}.default
    ];
}