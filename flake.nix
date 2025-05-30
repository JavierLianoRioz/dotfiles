{
  description = "my flake :D";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {

    nixosConfigurations = {
      tower = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };

        modules = [ 
          stylix.nixosModules.stylix
          ./configuration.nix
        ];
      };
    };

  };
}
