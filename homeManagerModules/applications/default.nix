{ lib, ... }:
{
  imports = [
    ./vscode
    ./kdeconnect
    ./krfb-virtualmonitor
  ];

  homeModules.programs.vscode.enable = lib.mkDefault true;
  homeModules.programs.kdeconnect.enable = lib.mkDefault true;
  homeModules.programs.krfbVirtualMonitor.enable = lib.mkDefault true;
}
