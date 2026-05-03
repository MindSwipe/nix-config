{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.typst = {
    enable = lib.mkEnableOption "Typst";
  };

  config =
    let
      cfg = config.homeModules.dev.typst;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        typst
        tinymist
        typstyle
      ];

      homeModules.programs.vscode = {
        additionalExtensions = with pkgs; [ vscode-extensions.myriad-dreamin.tinymist ];

        additionalUserSettings = {
          "[typst]" = {
            "editor.formatOnSave" = true;
          };
        };
      };

      homeModules.treefmt.additionalFormatters = [
        {
          name = pkgs.typstyle.pname;
          command = "${lib.getExe pkgs.typstyle}";
          includes = [
            "*.typ"
            "*.typst"
          ];
          arguments = [ "--edit" ];
          package = pkgs.typstyle;
        }
      ];
    };
}
