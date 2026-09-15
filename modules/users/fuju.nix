{ self, ... }: {
  flake.homeModules.fuju = { ... }: {
    imports = with self.homeModules; [
      vscode
      nix
      treefmt
      git
    ];

    home.username = "fuju";
    home.homeDirectory = "/home/fuju";

    # DO NOT MODIFY THIS UNLESS YOU KNOW WHAT YOU ARE DOING
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
}
