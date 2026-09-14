{ inputs, ... }:
{
  perSystem = { system, ... }: {
    _module.args.pkgsUnstable = import inputs.unstable-nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };

  flake.modules.nixos.base = {
    nixpkgs.overlays = [
      (final: _prev: {
        unstable = import inputs.unstable-nixpkgs {
          inherit (final) system;
          config.allowUnfree = true;
        };
      })
    ];
  };
}
