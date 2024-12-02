{ pkgs, lib, ... }:
{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    pkgs.openconnect
  ];
}