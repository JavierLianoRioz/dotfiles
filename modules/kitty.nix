{ config, pkgs, lib, ... }:

{
  options = {
    kitty.enable = lib.mkEnableOption "Enable kitty";
  };
  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      font.name = "Fira-code";
      extraConfig = ''
        background_opacity 0.6
        draw_minimal_borders yes
        windows_padding_width 2
        hide_window_decorations yes
        titlebar-only yes
        active_border_color none
        zsh
        '';
    };
  };
}
