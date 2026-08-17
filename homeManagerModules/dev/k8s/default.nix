{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.dev.k8s = {
    enable = lib.mkEnableOption "Kubernetes development";
  };

  config =
    let
      cfg = config.homeModules.dev.k8s;
    in
    lib.mkIf cfg.enable {
      homeModules.programs.vscode = {
        additionalExtensions = with pkgs; [
          vscode-extensions.redhat.vscode-yaml
          vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
        ];

        additionalUserSettings = {
          "yaml.schemas" = {
            "kubernetes" = [
              "secret.yaml"
              "pvc.yaml"
              "deployment.yaml"
              "certficate.yaml"
              "deployment.yaml"
              "job.yaml"
            ];
          };
        };
      };
    };
}
