{ config, pkgs, lib, ... }:


{
  options = {
    neovim.enable = lib.mkEnableOption "Enable neovim";
  };

  config = lib.mkIf config.neovim.enable (
    let
      nvimConfigPath = ./nvim;
    in
    {
      programs.neovim.enable = true;
      home.file.".config/nvim".source = nvimConfigPath;
    }
  );
}
