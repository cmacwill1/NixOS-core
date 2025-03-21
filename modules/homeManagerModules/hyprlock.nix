{ config, ... }: 

{
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
          path = "/home/cmacwill/NixOS-core/pfp.jpg";
          size = 150;
          border_size = 4;
          border_color = "rgb(0C96F9)";
          rounding = -1; # Negative means circle
          position = "0, 200";
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
}

