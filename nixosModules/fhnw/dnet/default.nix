{ lib, config, pkgs, ...}:
{
  options = {
    modules.fhnw.dnet.enable = lib.mkEnableOption "FHNW dnet";
  };

  config = lib.mkIf config.modules.fhnw.dnet.enable {
    environment.systemPackages = with pkgs; [
      ciscoPacketTracer8
      wireshark
    ];
  };
}