{ lib, config, pkgs, ... }:

{
  options = {
    modules.devenv.enable = lib.mkEnableOption "Devenv";
  };

  config = lib.mkIf config.modules.devenv.enable {
    environment.systemPackages = with pkgs; [
      devenv
    ];
  };
}