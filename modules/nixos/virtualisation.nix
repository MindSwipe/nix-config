{ ... }: {
  flake.nixosModules.virtualisation = { ... }: {
    # Enable QEMU/ KVM VMs and install Virt Manager
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
