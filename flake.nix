{
  description = "My small flake >:3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
        "midas" = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system; };

            modules = [
              ./hosts/midas/configuration.nix
              ./nixosModules
            ];
          };
      };

    homeConfigurations = {
        "midas" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
              ./hosts/midas/home.nix
              ./homeManagerModules
            ];
          };
      };
  };
}
