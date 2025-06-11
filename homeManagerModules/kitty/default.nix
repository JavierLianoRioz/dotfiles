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
    programs.zsh = {
    	enable = true;
    	shellAliases = {
	      l = "eza -l --icons=auto --git --no-permissions --no-user --no-filesize --no-time";
	      t = "eza --tree --icons=auto";
	      n = "nvim";
	      update = "sudo nixos-rebuild switch --flake ~/.dotfiles/#midas";
	};
    };
    programs.zoxide = {
    	enable = true;
	enableZshIntegration = true;
    };
    programs.fzf.enable = true;
  };
}
