{ ... }: {
  flake.homeModules.java =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        jetbrains.idea
      ];
    };
}
