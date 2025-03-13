{ lib, ... }:
{
  imports = [
    ./vscode
    ./kdeconnect
  ];

  homeModules.programs.vscode.enable = lib.mkDefault true;
  homeModules.programs.kdeconnect.enable = lib.mkDefault true;
}
