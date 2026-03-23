{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.dev.vue = {
    enable = lib.mkEnableOption "Vue dev extensions";
    nuxt = {
      enable = lib.mkEnableOption "Nuxt dev extensions";
    };
  };

  config = lib.mkIf config.homeModules.dev.vue.enable {
    homeModules.programs.vscode.additionalExtensions = with pkgs; [
      vscode-extensions.vue.volar
    ];
  };
}
