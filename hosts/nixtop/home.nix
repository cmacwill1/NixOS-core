{  ... }:

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

  rofi.enable = true;
  hyprland.enable = true;
  styling.enable = true;
  waybar.enable = true;
  minecraftClient.enable = true;
  fish.enable = true;
  starship.enable = true;

  git.enable = true;
  kitty.enable = true;
  screenshotter.enable = true;
  scripts.enable = true;


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

