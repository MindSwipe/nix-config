{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.modules.tailscale = {
    enable = lib.mkEnableOption "Tailscale";
  };

  config = lib.mkIf config.modules.tailscale.enable {
    services.tailscale.enable = true;
  };
}
