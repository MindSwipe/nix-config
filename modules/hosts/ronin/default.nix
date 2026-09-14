{ self, inputs, ... }: {
  flake.nixosConfigurations.ronin = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.roninConfiguration
      self.nixosModules.niri

      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPkgs = true;
      users.juri = self.homeManagerModules.juri;
    };
  };
}
