{ lib, ... }:
{
  imports = [
    ./nix
    ./csharp
    ./sql
    ./python
    ./opentofu
    ./java
    ./js
    ./rust
  ];

  homeModules.dev.nix.enable = lib.mkDefault true;
  homeModules.dev.csharp.enable = lib.mkDefault false;
  homeModules.dev.java.enable = lib.mkDefault false;
  homeModules.dev.sql.enable = lib.mkDefault false;
  homeModules.dev.python.enable = lib.mkDefault false;
  homeModules.dev.opentofu.enable = lib.mkDefault false;
  homeModules.dev.js = {
    enable = lib.mkDefault false;
    angular.enable = lib.mkDefault false;
  };
  homeModules.dev.rust = {
    enable = lib.mkDefault false;
    tauri.enable = lib.mkDefault false;
  };
}