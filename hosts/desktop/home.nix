{ lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";

 
  imports = [
    ../../modules/homeManagerModules
  ];
  
  cad.enable = true;
  firefox.enable = true;
  office.enable = true;
  research.enable = true;
  minecraftClient.enable = true;

  rofi.enable = true;
  hyprland-gaming-monitor.enable = true;
  hyprland.enable = false;
  styling.enable = true;
  waybar.enable = true;
  screenshotter.enable = true;
  fish.enable = true;
  starship.enable = true;

  git.enable = true;
  kitty.enable = true;
  #nixvim.enable = true;
  scripts.enable = true;

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
    }
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

