{
  lib,
  config,
  dms,
  danksearch,
  niri-nix,
  ...
}:
{
  imports = [
    dms.homeModules.dank-material-shell
    danksearch.homeModules.dsearch
    niri-nix.homeModules.default
  ];

  options.homeModules.dms = {
    enable = lib.mkEnableOption "Dank Material Shell";
  };

  config =
    let
      cfg = config.homeModules.dms;
    in
    lib.mkIf cfg.enable {
      xdg.configFile."niri/custom-config.kdl".source = ./assets/custom-config.kdl;
      wayland.windowManager.niri = {
        enable = true;

        settings = {
          include = [
            "custom-config.kdl"
          ];
        };
      };

      programs.dank-material-shell = {
        enable = true;
        enableSystemMonitoring = false;

        settings = {
          theme = "dark";
          dynamicTheming = true;
        };

        session = {
          isLightMode = false;
        };

        clipboardSettings = {
          maxHistory = 25;
          maxEntrySize = 5242880;
          autoClearDays = 1;
          clearAtStartup = true;
          disabled = false;
          disableHistory = false;
          disablePersist = true;
        };
      };

      programs.dsearch.enable = true;
    };
}
