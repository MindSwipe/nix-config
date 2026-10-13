{ ... }: {
  flake.homeModules.just =
    { pkgs, ... }:
    {
      config = {
        homeModules.vscode = {
          additionalExtensions = with pkgs; [
            vscode-extensions.nefrob.vscode-just-syntax
          ];
        };
      };
    };
}
