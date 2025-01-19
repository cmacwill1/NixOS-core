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

  config-emoji.enable = true;
  config-long.enable = true;
  hyprland-gaming-monitor.enable = false;
    
  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

