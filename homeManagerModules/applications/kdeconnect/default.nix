{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.homeModules.programs.kdeconnect = {
    enable = lib.mkEnableOption "KDE Connect";
  };

  config = lib.mkIf config.homeModules.programs.kdeconnect.enable {
    services.kdeconnect.enable = true;
  };
}