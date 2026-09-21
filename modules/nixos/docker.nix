{ self, ... }: {
  flake.nixosModules.docker = { ... }: {
    imports = [ self.nixosModules.extraGroups ];
    virtualisation.docker.enable = true;

    customGroups.extraGroups = [ "docker" ];
  };
}
