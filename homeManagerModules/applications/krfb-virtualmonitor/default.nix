{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homeModules.programs.krfbVirtualMonitor = {
    enable = lib.mkEnableOption "KRFB VirtualMonitor";
  };

  config = lib.mkIf config.homeModules.programs.krfbVirtualMonitor.enable {
    home.packages = with pkgs; [
      kdePackages.krfb
    ];
  };
}
