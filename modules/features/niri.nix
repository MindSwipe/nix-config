{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    let
      # Generates attributes like "${keybind}+${n}".${action} = ${n};
      # e.g. 'generateAllNumbers "Mod" "focus-workspace"' generates "Mod+${n}".focus-workspace = ${n}
      generateAllNumbers =
        keybind: action:
        builtins.listToAttrs (
          map (n: {
            name = "${keybind}+${toString n}";
            value.${action} = n;
          }) (lib.range 0 9)
        );
    in
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;

        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.myNoctalia)
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          input = {
            keyboard.xkb = {
              layout = "ch";
              variant = "de_nodeadkeys";
            };

            touchpad = {
              tap = _: { };
              natural-scroll = _: { };
            };
          };

          binds = {
            "Mod+T".spawn = lib.getExe pkgs.alacritty;
            "Mod+Q".close-window = _: { };
            "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
            "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

            # Lock
            "Super+Alt+L".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call sessionMenu lock";

            # Window resize
            "Mod+Left".focus-column-left = _: { };
            "Mod+Down".focus-window-down = _: { };
            "Mod+Up".focus-window-up = _: { };
            "Mod+Right".focus-column-right = _: { };
            "Mod+H".focus-column-left = _: { };
            "Mod+J".focus-window-down = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+L".focus-column-right = _: { };
            "Mod+F".maximize-column = _: { };
            "Mod+Shift+F".fullscreen-window = _: { };
            "Mod+Ctrl+F".expand-column-to-available-width = _: { };
            "Mod+Minus".set-column-width = "-10%";
            "Mod+Plus".set-column-width = "+10%";
            "Mod+Shift+Minus".set-column-width = "-5%";
            "Mod+Shift+Plus".set-column-width = "+5%";

            # Workspace movement
            "Mod+Ctrl+Page_Down".move-column-to-workspace-down = _: { };
            "Mod+Ctrl+Page_Up".move-column-to-workspace-up = _: { };
            "Mod+Page_Down".focus-workspace-down = _: { };
            "Mod+Page_Up".focus-workspace-up = _: { };
            "Mod+Shift+Page_Down".move-workspace-down = _: { };
            "Mod+Shift+Page_Up".move-workspace-up = _: { };
          }
          // generateAllNumbers "Mod" "focus-workspace"
          // generateAllNumbers "Mod+Ctrl" "move-column-to-workspace";
        };
      };
    };
}
