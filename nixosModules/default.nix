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
    ./bluetooth
    ./fhnw
  ];

  modules = {
    discord.enable = lib.mkDefault true;
    nvidia.enable = lib.mkDefault false;
    steam.enable = lib.mkDefault false;
    devenv.enable = lib.mkDefault true;
    bluetooth.enable = lib.mkDefault false;
    fhnw.dnet.enable = lib.mkDefault false;
  };
}