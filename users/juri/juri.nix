{ pkgs, ... }:
{
  users.users.juri = {
    isNormalUser = true;
    name = "juri";
    description = "Juri Furer";
    useDefaultShell = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      firefox
      nil
    ];
  };

  home-manager.users.juri = import ./home.nix;
}