{ config, pkgs, lib, ... }:

{
  options = {
    starship.enable = lib.mkEnableOption "Enable starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;

      enableZshIntegration = true;
    };
  };
}
