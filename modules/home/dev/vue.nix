{ ... }: {
  flake.homeModules.vue =
    {
      pkgs,
      lib,
      ...
    }:
    {
      home.activation.installVolarWritable =
        let
          volar = pkgs.vscode-extensions.vue.volar;
          # VS Code identifies extensions by "<publisher>.<name>-<version>"
          extSrc = "${volar}/share/vscode/extensions/Vue.volar";
          extDest = "$HOME/.vscode/extensions/Vue.volar";
        in
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          sentinel="${extDest}/.store-path"
          current="${volar}"

          if [ ! -f "$sentinel" ] || [ "$(cat "$sentinel")" != "$current" ]; then
            $DRY_RUN_CMD rm -rf "${extDest}"
            $DRY_RUN_CMD cp -r "${extSrc}" "${extDest}"
            $DRY_RUN_CMD chmod -R u+w "${extDest}"
            $DRY_RUN_CMD echo "$current" > "$sentinel"
          fi
        '';

    };
}
