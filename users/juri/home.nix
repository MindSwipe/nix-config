{ pkgs, ... }:
{
  imports = [
    ./../../homeManagerModules
    ./../../homeManagerModules/dev/nix
  ];

  home.username = "juri";
  home.homeDirectory = "/home/juri";

  home.packages = with pkgs; [

  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}