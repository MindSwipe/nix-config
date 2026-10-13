{ inputs, ... }: {
  flake.nixosModules.proxmox =
    let
      proxmox-nixos = inputs.proxmox-nixos;
      # Currently only this is the only officially supported system for Proxmox
      system = "x86_64-linux";
    in
    { ... }: {
      # proxmox-nixos currently doesn't support LXCs
      # Wait until https://github.com/SaumonNet/proxmox-nixos/pull/142 is merged
      imports = [ proxmox-nixos.nixosModules.proxmox-ve ];

      nixpkgs.overlays = [ proxmox-nixos.overlays.${system} ];

      services.proxmox-ve = {
        enable = true;
        ipAddress = "192.168.0.129";

        # Set the vmbr0 bridge interface
        bridges = [ "vmbr0" ];
      };

      # Actually set up the vmbr0 bridge
      systemd.network.networks."10-lan" = {
        matchConfig.Name = [ "ens18" ];
        networkConfig = {
          Bridge = "vmbr0";
        };
      };

      systemd.network.netdevs."vmbr0" = {
        netdevConfig = {
          Name = "vmbr0";
          Kind = "bridge";
        };
      };

      systemd.network.networks."10-lan-bridge" = {
        matchConfig.Name = "vmbr0";
        networkConfig = {
          IPv6AcceptRA = true;
          DHCP = "ipv4";
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };
}
