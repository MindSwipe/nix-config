{ ... }: {
  flake.homeManagerModules.vscode =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.homeManagerModules.vscode = {
        enable = lib.mkEnableOption "Visual Studio Code configuration";
        telemetry = lib.mkOption {
          default = "off";
          example = "off";
          type = lib.types.enum [
            "all"
            "error"
            "crash"
            "off"
          ];
        };

        additionalExtensions = lib.mkOption {
          default = [ ];
          example = [ ];
          type = lib.types.listOf lib.types.package;
          description = "Additional extensions that should be installed";
        };

        additionalUserSettings = lib.mkOption {
          default = { };
          description = "Additional user settings";
        };
      };

      config =
        let
          cfg = config.homeManagerModules.vscode;
        in
        lib.mkIf cfg.enable {
          programs.vscode = {
            enable = true;
            mutableExtensionsDir = true;

            profiles.default = {
              enableUpdateCheck = false;
              enableExtensionUpdateCheck = false;
              extensions =
                with pkgs;
                [
                  # Diverse
                  vscode-extensions.tomoki1207.pdf
                  vscode-extensions.ms-azuretools.vscode-docker
                  vscode-extensions.ms-vscode.live-server
                ]
                ++ config.homeModules.programs.vscode.additionalExtensions;

              userSettings = {

              }
              // config.homeModules.programs.vscode.additionalUserSettings;
            };
          };
        };
    };
}
