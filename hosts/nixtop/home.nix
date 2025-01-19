{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";
 
  imports = [
    ../../modules/homeManagerModules
  ];

    
  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

