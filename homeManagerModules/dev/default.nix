{ lib, ... }:
{
  imports = [
    ./nix
    ./csharp
  ];

  homeModules.dev.nix.enable = lib.mkDefault true;
  homeModules.dev.csharp.enable = lib.mkDefault false;
}