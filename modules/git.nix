{ config, pkgs, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "Enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "midas@tower";
      userEmail = "javier.liano@alumnos.uneatlantico.es";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
      extraConfig = {
        init.defaultBranch = "dev";
      };
    }
    ;
  };
}
