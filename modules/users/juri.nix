{ ... }: {
  flake.nixosModules.users.juri = { ... }: {
    isNormalUser = true;
    description = "Juri Furer";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  flake.homeModules.juri = { self, ... }: {
    imports = with self.homeModules; [
      vscode
      nix
    ];

    home.username = "juri";
    home.homeDirectory = "/home/juri";

    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

    self.homeModules.vscode.enable = true;
    self.homeModules.nix.enable = true;
  };
}
