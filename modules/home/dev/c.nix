{ ... }: {
  flake.homeModules.c =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.c;
    in
    {
      options.homeModules.c = {
        enable = lib.mkEnableOption "C";
      };

      config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
          clang
          clang-analyzer
          clang-tools
        ];

        homeModules.vscode = {
          additionalExtensions = with pkgs; [
            vscode-extensions.ms-vscode.cpptools
            vscode-extensions.llvm-vs-code-extensions.vscode-clangd
          ];

          additionalUserSettings = {
            # Disable the C/C++ Extension Intellisense, as it clashes with clangd
            "C_Cpp.intelliSenseEngine" = "disabled";
          };
        };
      };
    };
}
