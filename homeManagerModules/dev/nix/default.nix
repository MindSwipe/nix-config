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
      nixfmt-rfc-style
      nil
      deadnix
    ];

    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [ vscode-extensions.jnoortheen.nix-ide ];
    };
  };
}
