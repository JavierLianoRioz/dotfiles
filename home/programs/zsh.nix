{ config, pkgs, ... }:

{
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;

  shellAliases = {
    update = "sudo nixos-rebuild switch --flake /home/midas/.dotfiles/";
    updateHome = "home-manager switch -f /home/midas/.dotfiles/home.nix";
    ls = "lsd";
  };

  initContent = ''
eval "$(starship init zsh)"
  '';
}

