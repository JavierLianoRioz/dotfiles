# modules/nixos/services.nix
{ pkgs, ... }:
{
  # Servicios
  services = {
    # Display manager SDDM con tema personalizado
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
      settings.Theme.Current = "sddm-astronaut-theme";
    };

    # Teclado español
    xserver.xkb.layout = "es";

    # Impresión y audio
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;
}