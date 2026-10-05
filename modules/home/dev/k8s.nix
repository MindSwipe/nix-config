{ ... }: {
  flake.homeModules.k8s =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.k8s;
    in
    {
      options.homeModules.k8s = {
        enable = lib.mkEnableOption "Kubectl and Helm VS Code";
      };

      config = lib.mkIf cfg.enable {
        homeModules.vscode = {
          additionalExtensions = with pkgs; [
            vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
            vscode-extensions.tim-koehler.helm-intellisense
          ];
        };
      };
    };
}
