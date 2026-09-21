{ inputs, ... }: {
  flake.nixosModules.proxmox =
    let
      proxmox-nixos = inputs.proxmox-nixos;
      # Currently only this is the only officially supported system for Proxmox
      system = "x86_64-linux";
    in
    { ... }: {
      imports = [ proxmox-nixos.nixosModules.proxmox-ve ];

      nixpkgs.overlays = [ proxmox-nixos.overlays.${system} ];

      services.proxmox-ve = {
        enable = false;
        ipAddress = "192.168.0.129";
      };
    };
}
