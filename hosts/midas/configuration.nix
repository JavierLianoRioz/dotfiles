# hosts/midas/configuration.nix
{ pkgs, inputs, ... }:
let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  # Paquetes personalizados que necesitan estar disponibles en el scope
  environment.systemPackages = [
    custom-sddm-astronaut
  ];

  services.displayManager.sddm.extraPackages = [
    custom-sddm-astronaut
  ];

  system.stateVersion = "25.05"; # NO CAMBIAR
}
