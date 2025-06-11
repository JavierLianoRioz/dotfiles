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
    nixvim = {
        url = "github:nix-community/nixvim";
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
            specialArgs = { inherit system inputs; };

            modules = [
	     home-manager.nixosModules.home-manager {
                # Configura Home Manager para el usuario 'midas' (o el nombre de usuario que uses)
                home-manager.users.midas = {
                  imports = [
                    # Tus módulos de Home Manager ahora van aquí
                    ./hosts/midas/home.nix
                    ./homeManagerModules
                  ];
                  # Si necesitas opciones adicionales para Home Manager (no para tus módulos)
                  # por ejemplo, para activar la integración con nixos, aunque esto suele ser por defecto
                  # stateVersion = "23.11"; # Ajusta esto a tu versión de NixOS
                };
              }
              ./hosts/midas/configuration.nix
              ./nixosModules
            ];
          };
      };
  };
}
