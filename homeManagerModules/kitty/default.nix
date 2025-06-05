{ config, pkgs, lib, ... }:

{
  options = {
    kitty.enable = lib.mkEnableOption "Enable custom kitty configuration";
  };

  config = lib.mkIf config.kitty.enable {

    home.packages = [ 
      pkgs.eza
      pkgs.zoxide
    ];

    programs.kitty = {
      enable = true;

      font = {
        name = "Fira Code Nerd Font";
        size = 10.0;
      };

      settings = {
        adjust_line_height = 0;
        adjust_column_width = 0;
        cursor_shape = "block";
        scrollback_lines = 2000;
        url_color = "#0087bd";
        url_style = "single";
        enable_audio_bell = true;
        window_margin_width = 10.0;
        background_opacity = "0.8";
        allow_remote_control = true;
      };
    };

    # ---------- ALIAS ACTUALIZADOS PARA USAR 'eza' ----------
    # Añade los alias a la configuración de Zsh.
    programs.zsh.enable = true;
    programs.zsh.shellAliases = {
      # Mi recomendación para un 'ls' moderno:
      # -l: formato largo
      # --icons=auto: iconos automáticos
      # --header: cabecera para las columnas
      # --git: estado de git para cada archivo
      l = "eza -l --icons=auto --header --git";

      # Vista de árbol con iconos
      t = "eza --tree --icons=auto";
      
      # Si prefieres una vista de grid (cuadrícula) como el 'ls' clásico:
      lg = "eza --grid --icons=auto --header";
    };
  };
}
