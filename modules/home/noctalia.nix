{ ... }: {
  flake.homeModules.noctalia =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.noctalia;
    in
    {
      options.homeModules.noctalia = {
        enable = lib.mkEnableOption "Noctalia";

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

      config = lib.mkIf cfg.enable {
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
              # Add a button to the lock screen to suspend
              {
                action = "command";
                label = "Sleep";
                glyph = "bedtime";
                command = "systemctl suspend";
              }
            ];
          }
          // cfg.additionalSettings;
        };
      };
    };
}
