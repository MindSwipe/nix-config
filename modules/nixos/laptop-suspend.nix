{ ... }: {
  flake.nixosModules.laptopSuspend = { ... }: {
    # Hibernate after suspended for 30 minutes
    systemd.sleep.settings.Sleep.HibernateDelaySec = "30min";

    services.logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
