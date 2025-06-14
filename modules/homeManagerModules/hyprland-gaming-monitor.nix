{pkgs, lib, config, ... }:

{
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
  ];

  options = {
    hyprland-gaming-monitor.enable = 
      lib.mkEnableOption "enables hyprland config";
  };

  config = lib.mkIf config.hyprland-gaming-monitor.enable {

  hyprlock.enable = true;
  hypridle.enable = true;

  programs.hyprcursor-phinger.enable = true;

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
          monitor = [
            "DP-2,2560x1440@180,0x0,1"
	    "HDMI-A-1,1920x1080@60,-1080x-250,1,transform,1"
          ];
          windowrule = [
            "float, class:io.github.kaii_lb.Overskride"
            "center, class:io.github.kaii_lb.Overskride"
            "size 200 500, class:io.github.kaii_lb.Overskride"
            "float, class:org.pulseaudio.pavucontrol"
          ];      
          env = [
	    #"HYPRCURSOR_THEME,capitaine_gruvbox"
	    #"HYPRCURSOR_SIZE,24"
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
	  misc = {
            disable_hyprland_logo = true;
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
            bezier = "myBezier, 0.2, 0.9, 0.1, 1.05";
            animation = [
              "windows, 1, 5, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 5, default"
              "workspaces, 1, 5, default"
              "layers, 1, 5, myBezier, fade"
            ];
          };
          dwindle = {
            pseudotile = true; 
            preserve_split = true;
          };

	  workspace = [
	    "1, monitor:DP-2, default:true"
	    "2, monitor:DP-2"
	    "3, monitor:DP-2"
	    "4, monitor:DP-2"
	    "5, monitor:DP-2"
	    "6, monitor:DP-2"
	    "7, monitor:DP-2"
	    "8, monitor:DP-2"
	    "9, monitor:DP-2"
	    "10, monitor:DP-2"
	    "aux, monitor:HDMI-A-1"
	  ];

          "$mainMod" = "SUPER";

          bind = [

            "$mainMod, Q, exec, kitty"
            "$mainMod, C, killactive"
            "$mainMod, M, exit"
            "$mainMod, V, togglefloating"
            "$mainMod, P, pseudo"
            "$mainMod, J, togglesplit"
            "$mainMod, F, fullscreen"
            "$mainMod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"
            "$mainMod, SPACE, exec, rofi -show drun"
            #"$mainMod, escape, exec, rofi -show power-menu"
	    "$mainMod, Escape, exec, rofi -show p -modi p:'rofi-power-menu --symbols-font \"Symbols Nerd Font Mono\"' -font 'JetBrains Mono NF 16' -theme-str 'window { width: 8em; } listview { lines: 6; } entry { enabled: false; } inputbar { margin: 0px 10px 0px 10px; }'"
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
            "$mainMod SHIFT, S, exec, screenshotter-save-default"
	    "$mainMod, F1, exec, steam -bigpicture"
            ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
            ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
          ];
          bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
          ];
        
      };
  };
  };
}
