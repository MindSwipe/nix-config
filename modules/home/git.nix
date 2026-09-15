{ ... }: {
  flake.homeModules.git =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.git;
    in
    {
      options.homeModules.git = {
        enable = lib.mkEnableOption "Git Home Manager";

        signing = {
          enable = lib.mkEnableOption "Git sign using SSH";
          publichSshKey = lib.mkOption {
            example = "ssh-ed25519 AAAAAAAAAAAA...AA username@hostname";
            type = lib.types.str;
          };
        };

        user = {
          name = lib.mkOption {
            default = null;
            example = "John";
            type = lib.types.nullOr lib.types.str;
            description = "The name used for git";
          };

          email = lib.mkOption {
            default = null;
            example = "john@doe.org";
            type = lib.types.nullOr lib.types.str;
            description = "The email used for git";
          };
        };

        core = {
          editor = lib.mkOption {
            default = "${lib.getExe pkgs.vscode} --wait";
            example = "code --wait";
            type = lib.types.str;
            description = "The command to use for the git editor";
          };
        };
      };

      config = lib.mkIf cfg.enable {
        programs.git = {
          enable = true;

          signing = lib.mkIf cfg.signing.enable {
            key = cfg.signing.publichSshKey;
            signByDefault = true;
          };

          settings = {
            user = {
              name = cfg.user.name;
              email = cfg.user.email;
            };

            core = {
              editor = cfg.core.editor;
            };

            gpg = lib.mkIf cfg.signing.enable {
              format = "ssh";
            };

            push = {
              autoSetupRemote = true;
            };
          };
        };

        # TODO: Move this out to its own home manager module, eventually...
        programs.ssh.settings."*" = lib.mkIf cfg.signing.enable {
          ForwardAgent = false;
          AddKeysToAgent = "no";
          Compression = false;
          ServerAliveInterval = 0;
          ServerAliveCountMax = 3;
          HashKnownHosts = false;
          UserKnownHostsFile = "~/.ssh/known_hosts";
          ControlMaster = "no";
          ControlPath = "~/.ssh/master-%r@%n:%p";
          ControlPersist = "no";
        };
      };
    };
}
