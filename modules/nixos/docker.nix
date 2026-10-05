{ ... }: {
  # This modules requires the host to import the customGroups module
  flake.nixosModules.docker = { ... }: {
    virtualisation.docker.enable = true;

    customGroups.extraGroups = [ "docker" ];
  };
}
