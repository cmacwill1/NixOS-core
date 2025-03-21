{ config, lib, ... }: 

{
  options = {
    hyprlock.enable = 
      lib.mkEnableOption "enables hyprlock within hyprland";
  };

  config = lib.mkIf config.hyprlock.enable {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 1;
        hide_cursor = true;
        no_fade_in = false;
      };
      
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      
      image = [
        {
          path = "/home/cmacwill/NixOS-core/wallpapers/nix.png";
          size = 200;
          border_size = 0;
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];
    
      input-field = {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(${config.lib.stylix.colors.base06})";
          inner_color = "rgb(${config.lib.stylix.colors.base0A})";
          outer_color = "rgb(${config.lib.stylix.colors.base00})";
          outline_thickness = 5;
          placeholder_text = "Password";
          shadow_passes = 2;
        };
    };
  };
  };
}

