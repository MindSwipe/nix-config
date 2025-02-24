{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.sql = {
    enable = lib.mkEnableOption "SQL";
  };

  config = lib.mkIf config.homeModules.dev.sql.enable {
    home.packages = with pkgs; [
      jetbrains.datagrip
    ];
  };
}