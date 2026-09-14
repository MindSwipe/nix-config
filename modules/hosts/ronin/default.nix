{ self, inputs, ... }: {
  flake.nixosConfigurations.ronin = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.roninConfiguration
      self.nixosModules.niri

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit self inputs; };
        home-manager.users.juri = self.homeModules.juri;
      }
    ];
  };
}
