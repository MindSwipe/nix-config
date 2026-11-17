{ inputs, ... }: {
  flake.homeModules.noctalia =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      noctalia = inputs.noctalia;
      cfg = config.homeModules.noctalia;
    in
    {
      imports = [
        noctalia.homeModules.default
      ];

      options.homeModules.noctalia = {
        package = lib.mkOption {
          default = pkgs.noctalia;
          example = pkgs.noctalia;
          type = lib.types.package;
          description = "The Noctalia package to use";
        };

        additionalSettings = lib.mkOption {
          default = { };
          description = "Additional Noctalia settings";
        };
      };

      config = {
        programs.noctalia = {
          enable = true;
          package = cfg.package;

          settings = {
            idle.behavior = {
              lock = {
                # Lock after 5 minutes of idle
                timeout = 300;
                action = "lock";
              };
              suspend = {
                # Suspend after 15 minutes of idle if not locked
                timeout = 900;

                # Suspend after 2 minutes of idle locked
                locked_timeout = 120;
                action = "suspend";
                lock_before_suspend = true;
              };
            };

            shell.session.actions = [
              {
                action = "lock";
                shortcut = "1";
              }
              {
                action = "logout";
                shortcut = "2";
              }
              {
                action = "lock_and_suspend";
                shortcut = "3";
              }
              {
                action = "reboot";
                shortcut = "4";
              }
              {
                action = "command";
                label = "Hibernate";
                glyph = "zzz";
                command = "systemctl suspend";
                shortcut = "5";
              }
              {
                action = "shutdown";
                shortcut = "6";
                variant = "destructive";
              }
            ];
          }
          // cfg.additionalSettings;
        };
      };
    };
}
