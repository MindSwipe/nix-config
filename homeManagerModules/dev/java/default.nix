{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.homeModules.dev.java = {
    enable = lib.mkEnableOption "Java";
  };

  # This purposefully doesn't install a JDK, do it with a devenv or shell 
  config = lib.mkIf config.homeModules.dev.csharp.enable {
    home.packages = with pkgs; [
      jetbrains.idea-ultimate
    ];
  };
}