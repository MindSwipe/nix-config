{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
  };

  outputs = {
    nixpkgs,
    nixpkgs-python,
    ...
  }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pythonVersion = "3.13.1";
    myPython = nixpkgs-python.packages.${system}.${pythonVersion};
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        myPython
      ];

      shellHook = ''
        python --version
      '';
    };
  };
}