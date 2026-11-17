{ ... }: {
  flake.nixosModules.laptopSuspend = { ... }: {
    services.logind = {
      lidSwitch = "suspend-then-hibernate";
      lidSwitchDocked = "ignore";
    };

    systmed.sleep.settings.Sleep.HibernateDelaySec = "30min";
  };
}
