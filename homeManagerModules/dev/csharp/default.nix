{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.csharp = {
    enable = lib.mkEnableOption "C#";
  };

  config = lib.mkIf config.homeModules.dev.csharp.enable {
    home.packages = with pkgs; [
      jetbrains.rider
      dotnetCorePackages.sdk_10_0-bin
    ];
  };
}
