{ pkgs, ... }:
{
  imports = [
    ./../../homeManagerModules
    ./../../homeManagerModules/dev/nix
  ];

  home.username = "juri";
  home.homeDirectory = "/home/juri";

  home.packages = with pkgs; [
    discord
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}