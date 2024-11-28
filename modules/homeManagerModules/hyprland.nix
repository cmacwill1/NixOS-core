{lib, config, ... }:
with lib;
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = { 
          exec-once = [
            "waybar"
          ];
          layerrule = [
            "blur, waybar"
            "blur, rofi"
          ];

          windowrule = [
            "float, io.github.kaii_lb.Overskride"
            "center, io.github.kaii_lb.Overskride"
            "size 200 500, io.github.kaii_lb.Overskride"
            "float, pavucontrol"
          ];       
          general = {
            gaps_in = 5;
            gaps_out = 5;
            border_size = 2;
            layout = "dwindle";
            resize_on_border = true;
            "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base09}) rgb(${config.lib.stylix.colors.base0A}) 45deg";
            "col.inactive_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base00}ed)";
            allow_tearing = false;
          };
         
          input = {
            kb_layout = "us";
            follow_mouse = 1;
          };
          
          decoration = {
            rounding = 10;
            shadow = {
	            enabled = true;
	            range = 7;
	            render_power = 2;
	            color = lib.mkForce "rgba(${config.lib.stylix.colors.base00}ed)";
            };

            blur = {
              enabled = true;
              size = 8;
              passes = 2;
              vibrancy = 0.2;
            };
          };

          animations = {
            enabled = true;
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
              "windows, 1, 3, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 2, default"
              "workspaces, 1, 3, default"
              "layers, 1, 5, myBezier, slide bottom"
            ];
          };
          dwindle = {
            pseudotile = true; 
            preserve_split = true;
          };

          "$mainMod" = "SUPER";

          bind = [

            "$mainMod, Q, exec, kitty"
            "$mainMod, C, killactive"
            "$mainMod, M, exit"
            "$mainMod, V, togglefloating"
            "$mainMod, P, pseudo"
            "$mainMod, J, togglesplit"
            "$mainMod, F, fullscreen"
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"
            "$mainMod, SPACE, exec, rofi -show drun"
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"
            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"
          ];
          bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
          ];
        
      };
  };
}
