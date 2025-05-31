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

  outputs = { self, nixpkgs, stylix, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      midas = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system self; };
        modules = [ 
          stylix.nixosModules.stylix
          ./hosts/midas/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      midas = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/midas/home.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
