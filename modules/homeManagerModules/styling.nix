{ pkgs, lib, config, ... }:

{
  options = {
    styling.enable =      
      lib.mkEnableOption "enables gtk / stylix theming";
  };

  config = lib.mkIf config.styling.enable {
    stylix = {
      targets = {
	waybar.enable = false;
	rofi.enable = false;
	hyprlock.enable = false;
	nixvim.enable = true;
	fish.enable = true;
	kitty.enable = true;
      };
      opacity.terminal = 0.85;
    };

    gtk = {
      iconTheme = {
	name = "Papirus-Dark";
	package = pkgs.papirus-icon-theme;
      };
    };
  };
}
