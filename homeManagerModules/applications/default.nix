{ lib, ... }:
{
  imports = [
    ./vscode
  ];

  homeModules.programs.vscode.enable = lib.mkDefault true;
}
