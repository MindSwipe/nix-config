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

  # This purposefully doesn't install the SDK, do it in a devshell 
  config = lib.mkIf config.homeModules.dev.csharp.enable {
    home.packages = with pkgs; [
      jetbrains.rider
    ];
  };
}