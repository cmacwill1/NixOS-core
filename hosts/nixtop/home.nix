{ ... }:

{
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";

  imports = [
    ../../modules/homeManagerModules
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      y = 0;
      offSwitch = "Lid Switch";
    }
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
