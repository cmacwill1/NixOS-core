{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";
 
  imports = [
    ../../modules/homeManagerModules
  ];
  
  cad.enable = false;
  firefox.enable = true;
  office.enable = true;
  research.enable = true;

  rofi.enable = true;
  hyprland-gaming-monitor.enable = false;
  hyprland.enable = true;
  styling.enable = true;
  waybar.enable = true;
  wlogout.enable = false;

  git.enable = true;
  kitty.enable = true;
  nixvim.enable = true;
  scripts.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

