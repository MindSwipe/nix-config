{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.ronin = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.roninConfiguration
      self.nixosModules.niri
      self.nixosModules.juri

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.backupFileExtension = "bak";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.juri = self.homeModules.juri;
      }
    ];
  };
}
