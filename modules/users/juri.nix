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
      git
      fish
      tmux
      alacritty

      self.unfree
    ];

    homeModules = {
      vscode.enable = true;
      nix.enable = true;
      treefmt.enable = true;
      fish.enable = true;
      tmux.enable = true;
      alacritty.enable = true;

      git = {
        enable = true;

        user = {
          name = "Juri Furer";
          email = "juri.furer@pm.me";
        };

        signing = {
          enable = true;
          publichSshKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICvzuc7DTJjkOKdXUZzUJYN7d0M8FZklPQrtyZb8TEXM juri@ronin";
        };
      };
    };

    home.username = "juri";
    home.homeDirectory = "/home/juri";

    # DO NOT MODIFY THIS UNLESS YOU KNOW WHAT YOU ARE DOING
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;
  };
}
