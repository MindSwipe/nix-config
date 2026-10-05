{ ... }: {
  flake.homeModules.csharp =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.csharp;
    in
    {
      options.homeModules.csharp = {
        enable = lib.mkEnableOption "C#";
      };

      config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
          jetbrains.rider
          dotnetCorePackages.sdk_10_0-bin
        ];
      };
    };
}
