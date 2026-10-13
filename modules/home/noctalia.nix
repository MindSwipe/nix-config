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

          # theme = {
          #   mode = "dark";
          # };
        };
      };
    };
}
