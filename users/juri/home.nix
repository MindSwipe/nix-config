{ pkgs, ... }:
{
  imports = [
    ./../../homeManagerModules
  ];

  home.username = "juri";
  home.homeDirectory = "/home/juri";

  home.packages = with pkgs; [

  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  homeModules.dev.nix.enable = true;
  homeModules.dev.csharp.enable = true;
  homeModules.dev.sql.enable = true;
  homeModules.dev.python.enable = true;
  homeModules.dev.opentofu.enable = true;
  homeModules.dev.java.enable = true;
  homeModules.dev.js = {
    enable = true;
    angular.enable = true;
  };
  homeModules.dev.rust = {
    enable = true;
    tauri.enable = true;
  };
}