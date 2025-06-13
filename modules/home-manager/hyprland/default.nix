{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [ swww ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        input.kb_layout = "es";

        exec-once = [
          "hyprctl setcursor rose-pine-hyprcursor 24"
          "sleep 0.1 && swww-daemon && swww img ./Cat.png"
        ];

        # env = "HYPRCURSOR_THEME,rose-pine-hyprcursor";

        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$buscador" = "firefox";

        bind = import ./keybinds.nix;
        bindm = [ "ALT, mouse:272, movewindow" ];
        bindc = [ "ALT, mouse:272, togglefloating" ];

        binds.drag_threshold = 10;

        cursor.no_hardware_cursors = true;

        decoration.rounding = 10;

      };
    };
  };
}
