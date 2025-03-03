{ lib, ... }:
{
  imports = [
    ./dev
    ./discord
    ./settings
    ./vpn
    ./nvidia
    ./steam
    ./devenv
  ];

  modules = {
    discord.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;
    steam.enable = lib.mkDefault false;
    devenv.enable = lib.mkDefault true;
  };
}