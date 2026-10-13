{ ... }: {
  flake.homeModules.rust =
    {
      # lib
      # config,
      pkgs,
      ...
    }:
    let
      # cfg = config.homeModules.rust;
    in
    {
      options.homeModules.rust = {
      };

      config = {
        homeModules.vscode = {
          additionalExtensions = with pkgs; [
            vscode-extensions.rust-lang.rust-analyzer
            vscode-extensions.tamasfe.even-better-toml
          ];
        };
      };
    };
}
