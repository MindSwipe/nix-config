{ lib, ... }:
{
  imports = [
    ./dev
    ./discord
    ./settings
    ./vpn
  ];

  modules = {
    discord.enable = lib.mkDefault true;
  };
}