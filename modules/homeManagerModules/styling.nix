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
	nixvim.enable = false;
	fish.enable = true;
	kitty.enable = true;
      };
      opacity.terminal = 0.85;
    };

    gtk = {
      cursorTheme = {
	name = "Capitaine Cursors (Gruvbox)";
	package = pkgs.capitaine-cursors-themed;
      };
      iconTheme = {
	name = "Papirus-Dark";
	package = pkgs.papirus-icon-theme;
      };
    };

    home.pointerCursor = {
      enable = true;
      name = "Capitain Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      gtk.enable = true;
    };
  };
}
