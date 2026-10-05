{ ... }: {
  flake.homeModules.nix =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.nix;
    in
    {
      options.homeModules.nix = {
        enable = lib.mkEnableOption "Nix";
      };

      config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
          nixd
          deadnix
        ];

        homeModules.vscode = {
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
            package = pkgs.nixfmt;
            name = "nixfmt";
            command = "nixfmt";
            includes = [ "*.nix" ];
          }
        ];
      };
    };
}
