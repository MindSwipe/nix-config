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
  homeModules.dev.csharp.enable = false;
  homeModules.dev.sql.enable = false;
  homeModules.dev.python.enable = false;
  homeModules.dev.opentofu.enable = false;
  homeModules.dev.java.enable = false;
  homeModules.dev.js = {
    enable = false;
    angular.enable = false;
  };
  homeModules.dev.rust = {
    enable = false;
    tauri.enable = false;
  };
  homeModules.dev.c.enable = false;

  homeModules.treefmt = {
    enable = true;
  };
}
