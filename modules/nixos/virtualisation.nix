{ ... }: {
  flake.nixosModules.virtualisation = { pkgs, ... }: {
    # Enable QEMU/ KVM VMs and install Virt Manager
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    customGroups.extraGroups = [ "libvirtd" ];

    # Required for default NAT network DNS and DHCP functionality
    environment.systemPackages = with pkgs; [ dnsmasq ];

    # Allow the virtual bridge interface through the firewall
    networking.firewall.trustedInterfaces = [ "virbr0" ];
  };
}
