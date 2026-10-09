{ ... }: {
  flake.homeModules.js = { pkgs, ... }: {
    config = {
      homeModules.vscode = {
        additionalExtensions = with pkgs; [
          vscode-extensions.prettier.prettier-vscode
        ];
      };
    };
  };
}
