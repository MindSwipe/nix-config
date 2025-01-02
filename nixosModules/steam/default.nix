{ lib, config, pkgs, ... }:
{
  options = {
    modules.steam.enable = lib.mkEnableOption "Steam";
  };

  config = lib.mkIf config.modules.steam.enable {
    environment.systemPackages = with pkgs; [
      steam
    ];

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}