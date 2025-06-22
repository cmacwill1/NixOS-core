{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";

 
  imports = [
    ../modules/homeManagerModules
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

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

