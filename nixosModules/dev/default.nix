{ pkgs, lib, ... }:
{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    vscode
    git
  ];
}