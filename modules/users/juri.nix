{ self, ... }: {
  flake.nixosModules.juri = { ... }: {
    users.users.juri = {
      isNormalUser = true;
      description = "Juri Furer";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  flake.homeModules.juri = { ... }: {
    imports = with self.homeModules; [
      vscode
      nix
      treefmt
    ];

    homeModules = {
      vscode.enable = true;
      nix.enable = true;
      treefmt.enable = true;
    };

    home.username = "juri";
    home.homeDirectory = "/home/juri";

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
}
