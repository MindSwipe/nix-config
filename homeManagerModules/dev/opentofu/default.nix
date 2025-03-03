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
    homeModules.programs.vscode = {
      additionalExtensions = with pkgs; [
        vscode-extensions.hashicorp.terraform
        vscode-extensions.hashicorp.hcl
      ];
    };
  };
}