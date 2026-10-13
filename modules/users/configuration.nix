{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.homeConfigurations = lib.genAttrs [ "juri" "fuju" ] (
    user:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
      modules = [ self.homeModules.${user} ];
    }
  );
}
