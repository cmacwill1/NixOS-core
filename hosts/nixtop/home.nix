{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";
 
  imports = [
    ../../modules/homeManagerModules/hyprland.nix
    ../../modules/homeManagerModules/kitty.nix
    ../../modules/homeManagerModules/waybar.nix
    ../../modules/homeManagerModules/rofi.nix
    ../../modules/homeManagerModules/config-emoji.nix
    ../../modules/homeManagerModules/config-long.nix 
    ../../modules/homeManagerModules/wlogout/wlogout.nix
    ../../modules/homeManagerModules/nvim/nvim.nix
    ../../modules/homeManagerModules/git.nix
    ../../modules/homeManagerModules/firefox.nix
    ../../modules/homeManagerModules/styling.nix
    ../../modules/homeManagerModules/scripts.nix
  ];

    
  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

