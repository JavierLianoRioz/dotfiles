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

      # --- CAMBIO AÑADIDO ---
      # Elige tu sabor de Catppuccin preferido.
      # Opciones: "Catppuccin-Latte", "Catppuccin-Frappe", "Catppuccin-Macchiato", "Catppuccin-Mocha"
      theme = "Catppuccin-Mocha";

      font = {
        name = "Fira Code Nerd Font";
        size = 10.0;
      };

      settings = {
        # --- TIPOS DE DATOS CORREGIDOS ---
        adjust_line_height = 0;
        adjust_column_width = 0;
        cursor_shape = "block";
        scrollback_lines = 2000;
        url_color = "#0087bd";
        url_style = "single";
        enable_audio_bell = true;
        window_margin_width = 10; # Corregido a número entero
        background_opacity = 0.8;  # Corregido a número flotante
        allow_remote_control = true;
      };

      # --- OPCIONAL: Estilo de la barra de pestañas como en las capturas de Catppuccin ---
      # Descomenta las siguientes líneas si quieres el estilo "powerline" para las pestañas.
      # extraConfig = ''
      #   tab_bar_min_tabs          1
      #   tab_bar_edge              bottom
      #   tab_bar_style             powerline
      #   tab_powerline_style       slanted
      #   tab_title_template        {title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}
      # '';
    };

    programs.zsh = {
      enable = true;
      shellAliases = {
        l = "eza -l --icons=auto --git --no-permissions --no-user --no-filesize --no-time";
        t = "eza --tree --icons=auto";
        n = "nvim";
	update = "git add ~/.dotfiles && git commit -m 'update' && sudo nixos-rebuild switch --flake ~/.dotfiles/#midas";
      };
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf.enable = true;

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
