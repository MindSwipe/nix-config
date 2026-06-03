{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.opentofu = {
    enable = lib.mkEnableOption "Opentofu";
  };

  config = lib.mkIf config.homeModules.dev.opentofu.enable {
    home.packages = with pkgs; [
      opentofu
      tofu-ls
    ];

    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        vscode-marketplace.opentofu.vscode-opentofu
      ];
    };
  };
}
