{ lib, ... }:
{
  imports = [
    ./nix
  ];

  homeModules.dev.nix.enable = lib.mkDefault true;
}