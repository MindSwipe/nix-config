{ ... }: {
  flake.nixosModules.extraGroups = { lib, ... }: {
    options.customGroups.extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Extra groups to add to users";
    };
  };
}
