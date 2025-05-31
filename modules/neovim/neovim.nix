{ config, pkgs, lib, ... }:


{
  options = {
    nvim.enable = lib.mkEnableOption "Enable nvim";
  };

  config = lib.mkIf config.nvim.enable (
    let
      nvimConfigPath = ./nvim;
    in
    {
      home.file.".config/nvim".source = nvimConfigPath;
    }
  );
}
