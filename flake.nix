{
  description = "My small flake >:3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/hyprland?ref=v0.36.0";
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };
    nixvim.url = "github:elythh/nixvim";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
        "midas" = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system inputs; };

            modules = [
              home-manager.nixosModules.home-manager
              ./hosts/midas/configuration.nix
              ./modules/nixos
              {
                home-manager.users.midas = {
                  imports = [
                    ./hosts/midas/home.nix
                    ./modules/home-manager
                  ];
                };
              }
            ];
          };
      };
  };
}
