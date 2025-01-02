{
  config,
  lib,
  ...
}:
{
  options.homeModules.programs.discord = {
    enable = lib.mkEnableOption "Discord";
  };

  config = lib.mkIf config.homeModules.programs.vscode.enable {
    programs.discord = {
      enable = true;
    };
  };
}
