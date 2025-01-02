{ lib, config, pkgs, ...}:
{
  options = {
    modules.discord.enable = lib.mkEnableOption "Discord";
  };

  config = lib.mkIf config.modules.discord.enable {
    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}