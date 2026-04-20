{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";

      # The `follows` ensures that the versions are kept consistent with
      # the current flake. It works like inheritance in OOP
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        "stryder" = lib.nixosSystem {
          system = "${system}";
          modules = [
            ./hosts/stryder/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };

        "ronin" = lib.nixosSystem {
          system = "${system}";
          modules = [
            ./hosts/ronin/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };

        "vanguard" = lib.nixosSystem {
          system = "${system}";
          modules = [
            ./hosts/vanguard/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };

      homeConfigurations = {
        "juri" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/juri/home.nix ];
        };
      };
    };
}
