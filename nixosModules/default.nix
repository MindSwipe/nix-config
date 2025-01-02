{ lib, ... }:
{
  imports = [
    ./dev
    ./discord
    ./settings
    ./vpn
    ./nvidia
    ./steam
  ];

  modules = {
    discord.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;
    steam.enable = lib.mkDefault false;
  };
}