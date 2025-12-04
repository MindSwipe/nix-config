{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.dev.nix = {
    enable = lib.mkEnableOption "Nix";
  };

  config = lib.mkIf config.homeModules.dev.nix.enable {
    home.packages = with pkgs; [
      nixd
      deadnix
    ];

    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [ vscode-extensions.jnoortheen.nix-ide ];
      additionalUserSettings = {
        nix.enableLanguageServer = true;
        nix.serverPath = "nixd";
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };

        "[nix]" = {
          editor.formatOnSave = true;
        };
      };
    };

    homeModules.treefmt.additionalFormatters = [
      {
        package = pkgs.nixfmt-rfc-style;
        name = "nixfmt-rfc-style";
        command = "nixfmt";
        includes = [ "*.nix" ];
      }
    ];
  };
}
