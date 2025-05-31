{ config, pkgs, lib, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "Enable zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      shellAliases = {
        update = "sudo nixos-rebuild switch --flake /home/midas/.dotfiles/";
        updateHome = "home-manager switch -f /home/midas/.dotfiles/home.nix";
        ls = "lsd";
        cd = "z";
      };

      initContent = ''
        eval "$(starship init zsh)"
        '';
    };
  };
}
