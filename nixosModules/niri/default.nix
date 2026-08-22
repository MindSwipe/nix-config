{
  lib,
  config,
  ...
}:
{
  options.modules.niri = {
    enable = lib.mkEnableOption "Niri";
  };

  config =
    let
      cfg = config.modules.niri;
    in
    lib.mkIf cfg.enable {
      programs.niri.enable = true;
    };
}
