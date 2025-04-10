{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.dev.js = {
    enable = lib.mkEnableOption "JavaScript";
    angular = {
      enable = lib.mkEnableOption "Angular plugins";
    };
  };

  config = lib.mkIf config.homeModules.dev.js.enable {
    home.packages = with pkgs; [
      typescript-language-server
      typescript
    ];

  } // lib.mkIf config.homeModules.dev.js.angular.enable {
    home.packages = with pkgs; [
      angular-language-server
    ];

    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        vscode-extensions.esbenp.prettier-vscode
        vscode-extensions.dbaeumer.vscode-eslint
        vscode-extensions.usernamehw.errorlens
        vscode-extensions.editorconfig.editorconfig
        vscode-extensions.angular.ng-template
      ];

      additionalUserSettings = {
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
        };
        "javascript.updateImportsOnFileMove.enabled" = "always";
      };
    };
  };
}
