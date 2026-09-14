{ self, inputs, ... }: {
  flake.nixosConfigurations.ronin = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.roninConfiguration
      self.nixosModules.niri
    ];
  };
}
