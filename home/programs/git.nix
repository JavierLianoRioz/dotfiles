{ config, pkgs, ... }:

{
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

