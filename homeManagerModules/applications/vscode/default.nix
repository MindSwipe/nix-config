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
    naturalLanguageSearch = lib.mkOption {
      default = false;
      example = false;
      type = lib.types.bool;
      description = "Wether to enable natural language search for options. Needs a Microsoft online service.";
    };
    scm.alwaysShowRepositories = lib.mkOption {
      default = true;
      example = true;
      type = lib.types.bool;
      description = "Wether to always show the repository inside the SCM tab";
    };
    scm.showHistoryGraph = lib.mkOption {
      default = true;
      example = true;
      type = lib.types.bool;
      description = "Wether to a history graph instead of changes inside the SCM tab";
    };
    additionalExtensions = lib.mkOption {
      default = [ ];
      example = [ ];
      type = lib.types.listOf lib.types.package;
      description = "Additional extensions that should be installed";
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
    };
  };
}