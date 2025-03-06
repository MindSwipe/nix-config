{
  lib,
  config,
  ...
}:

{
  options.modules.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth";
  };

  config = lib.mkIf config.modules.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}