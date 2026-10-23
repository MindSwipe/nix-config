{ ... }: {
  flake.homeModules.alacritty =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.homeModules.alacritty;
    in
    {
      options.homeModules.alacritty = {
        enable = lib.mkEnableOption "Alacritty";
      };

      config = lib.mkIf cfg.enable {
        programs.alacritty = {
          enable = true;

          settings = {
            terminal.shell = {
              program = "${lib.getExe pkgs.tmux}";

              args = [
                "new-session"
                "-t"
                "main"
              ];
            };

            font = {
              normal = {
                family = "MesloLGS NF";
                style = "Regular";
              };
              bold = {
                family = "MesloLGS NF";
                style = "Bold";
              };
              italic = {
                family = "MesloLGS NF";
                style = "Italic";
              };
            };

            window = {
              resize_increments = true;
            };
          };
        };
      };
    };
}
