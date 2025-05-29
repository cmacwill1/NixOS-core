{ pkgs, ... }:

{
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    udiskie
  ];
  #Please note that the udiskie automounting daemon is managed by home-manager
}
