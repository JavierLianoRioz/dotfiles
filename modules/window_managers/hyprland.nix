{ config, pkgs, lib, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        input.kb_layout = "es";
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$buscador" = "firefox";
        bind = [
          "$mod, T, exec, $terminal"
            "$mod, F, exec, $buscador"
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, K, movefocus, u"
            "$mod, J, movefocus, d"
            "$mod, Q, killactive"
            "$mod, M, exec, pkill ."
        ];
        bindm = ["ALT, mouse:272, movewindow"];
        bindc = ["ALT, mouse:272, togglefloating"];
        binds.drag_threshold = 10;

        cursor.no_hardware_cursors = true;

        monitor = [
          "DP-3,2560x1440@143.97,0x0,1"
            "DP-2,2560x1080@60.00,2560x0,1"
        ];

        decoration.rounding = 10;

      };
    };
  };
}
