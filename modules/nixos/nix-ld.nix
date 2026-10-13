{ ... }: {
  flake.nixosModules.nix-ld = { pkgs, ... }: {
    programs.nix-ld.enable = true;

    # Handful of frequently needed packages
    programs.nix-ld.libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      curl
      icu
    ];
  };
}
