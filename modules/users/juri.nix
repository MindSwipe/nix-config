{ ... }: {
  flake.nixosModules.users.juri = { ... }: {
    isNormalUser = true;
    description = "Juri Furer";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  flake.homeManagerModules.juri = { ... }: {
    home.username = "juri";
    home.homeDirectory = "/home/juri";

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
}
