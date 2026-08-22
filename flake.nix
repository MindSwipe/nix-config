{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";

      # The `follows` ensures that the versions are kept consistent with
      # the current flake. It works like inheritance in OOP
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      nix-vscode-extensions,
      dms,
      danksearch,
      niri-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;

        overlays = [
          nix-vscode-extensions.overlays.default
        ];
      };

      vscodeOverlayModule = {
        nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
      };
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
            nixos-hardware.nixosModules.framework-amd-ai-300-series
            vscodeOverlayModule
            niri-nix.nixosModules.default

            ./hosts/ronin/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit dms danksearch niri-nix; };
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
          inherit pkgs system;
          modules = [ ./users/juri/home.nix ];

          extraSpecialArgs = {
            inherit dms danksearch niri-nix;
          };
        };
      };
    };
}
