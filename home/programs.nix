{ config, pkgs, ... }:

{
  kitty = import ./programs/kitty.nix { inherit config pkgs; };
  zsh = import ./programs/zsh.nix { inherit config pkgs; };
  git = import ./programs/git.nix { inherit config pkgs; };
  fzf = import ./programs/fzf.nix { inherit config pkgs; };
  neovim = import ./programs/neovim.nix { inherit config pkgs; };
  hyprland = import ./programs/hyprland.nix { inherit config pkgs; };
  starship = import ./programs/starship.nix { inherit config pkgs; };
  stylix = import ./programs/starship.nix { inherit config pkgs; };
}

