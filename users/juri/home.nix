{ pkgs, ... }:
{
  imports = [
    ./../../homeManagerModules
  ];

  home.username = "juri";
  home.homeDirectory = "/home/juri";

  home.packages = with pkgs; [

  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  homeModules.dev.csharp.enable = true;
}