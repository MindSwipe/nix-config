{ lib, ... }:
{
  imports = [
    ./nix
    ./csharp
    ./sql
  ];

  homeModules.dev.nix.enable = lib.mkDefault true;
  homeModules.dev.csharp.enable = lib.mkDefault false;
  homeModules.dev.sql.enable = lib.mkDefault false;
}