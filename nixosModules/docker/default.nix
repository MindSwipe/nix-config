{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    modules.docker.enable = lib.mkEnableOption "Docker";
  };

  config = lib.mkIf config.modules.docker.enable {
    virtualisation.docker.enable = true;
  };
}