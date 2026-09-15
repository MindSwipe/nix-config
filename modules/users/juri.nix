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
    ];

    homeModules.vscode = {
      enable = true;
      additionalUserSettings.workbench.secondarySideBar.defaultVisibility = "hidden";
    };

    homeModules.nix = {
      enable = true;
    };

    home.username = "juri";
    home.homeDirectory = "/home/juri";

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

    # self.homeModules.vscode.enable = true;
    # self.homeModules.nix.enable = true;
  };
}
