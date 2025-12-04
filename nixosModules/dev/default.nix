{ pkgs, lib, ... }:
{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    vim
    git
  ];
}
