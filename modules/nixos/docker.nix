{ self, ... }: {
  flake.nixosModules.docker = { ... }: {
    imports = [ self.nixosModules.customGroups ];
    virtualisation.docker.enable = true;

    customGroups.extraGroups = [ "docker" ];
  };
}
