{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.dev.rust = {
    enable = lib.mkEnableOption "Rust";
    tauri = {
      enable = lib.mkEnableOption "Tauri plugins";
    };
  };

  config = lib.mkIf config.homeModules.dev.rust.enable {
    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        rust-analyzer
        vscode-extensions.rust-lang.rust-analyzer
      ];
    };
  } // lib.mkIf config.homeModules.dev.rust.tauri.enable {
    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        vscode-extensions.tauri-apps.tauri-vscode
      ];
    };
  };
}