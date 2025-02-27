{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.python = {
    enable = lib.mkEnableOption "Python";
  };

  config = lib.mkIf config.homeModules.dev.nix.enable {
    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        vscode-extensions.ms-python.python
        vscode-extensions.ms-python.debugpy
      ];
    };
  };
}