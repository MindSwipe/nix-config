{ lib, config, ... }:
{
  options = {
    modules.nvidia.enable = lib.mkEnableOption "Proprietary Nvidia drivers and config";
  };

  config = lib.mkIf config.modules.nvidia.enable {
    # Enable and configure Nvidia drivers
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}