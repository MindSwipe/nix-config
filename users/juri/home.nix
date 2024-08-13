{ pkgs, ... }:
{
  imports = [ ./../../homeManagerModules ];

  home.username = "juri";
  home.homeDirectory = "/home/juri";

  home.packages = with pkgs; [

  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}