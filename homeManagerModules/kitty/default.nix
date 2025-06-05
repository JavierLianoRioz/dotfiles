{ config, pkgs, lib, ... }:

{
  options = {
    kitty.enable = lib.mkEnableOption "Enable kitty";
  };
  config = lib.mkIf config.kitty.enable {
    programs.kitty.enable = true;
    home.file.".config/kitty/kitty.conf".text = builtins.readFile ./kitty.conf;
  };
}
