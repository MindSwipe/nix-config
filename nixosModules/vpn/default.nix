{ pkgs, lib, ... }:
{
  imports = [
    ./openconnect.nix
    ./tailscale.nix
  ];
}
