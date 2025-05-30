{ config, pkgs, ... }:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  enable = true;

  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraPackages = with pkgs; [
    xclip
    wl-clipboard
  ];

  plugins = with pkgs.vimPlugins; [
    LazyVim
    mini-nvim
    nvim-lspconfig
    catppuccin-nvim
    lualine-nvim
    nvim-web-devicons
    telescope-nvim
    telescope-fzf-native-nvim
    (nvim-treesitter.withPlugins (p: [
      p.tree-sitter-nix
      p.tree-sitter-vim
      p.tree-sitter-bash
      p.tree-sitter-lua
      p.tree-sitter-json
    ]))
    vim-nix
  ];

  extraLuaConfig = ''
    ${builtins.readFile ../.././nvim/options.lua}
  '';
}

