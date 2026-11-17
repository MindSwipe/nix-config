{ ... }: {
  flake.nixosModules.laptopSuspend = { ... }: {
    systemd.sleep.settings.Sleep.HibernateDelaySec = "30min";

    services.logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
