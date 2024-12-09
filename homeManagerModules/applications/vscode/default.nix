{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homeModules.programs.vscode = {
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

  config = lib.mkIf config.homeModules.programs.vscode.enable {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs;
        [
          # Diverse
          vscode-extensions.tomoki1207.pdf
          vscode-extensions.ms-azuretools.vscode-docker
          vscode-extensions.ms-vscode.live-server
        ]
        ++ config.homeModules.programs.vscode.additionalExtensions;
      
      userSettings = {

      } // config.homeModules.programs.vscode.additionalUserSettings;
    };
  };
}