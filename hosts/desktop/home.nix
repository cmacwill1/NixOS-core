{ ... }:

{
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";

  imports = [
    ../../modules/homeManagerModules
  ];

  monitors = [
    {
      name = "DP-2";
      width = 2560;
      height = 1440;
      refreshRate = 180;
      x = 0;
      y = 0;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = -1080;
      y = 0;
      rotated = ",transform,1";
      showWaybar = false;
    }
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
