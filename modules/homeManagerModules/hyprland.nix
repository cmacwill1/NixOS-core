{pkgs, lib, config, ... }:

let
  monitors = config.monitors;
  monitorMain = builtins.elemAt monitors 0;
  workspaceBase = map (i:
    "${toString i}, monitor:${monitorMain.name}${if i == 1 then ", default:true" else ""}"
  ) (builtins.genList (i: i + 1) 10);
  auxWorkspace = if builtins.length monitors > 1 then
    [ "aux, monitor:${(builtins.elemAt monitors 1).name}" ]
  else
    [ ];
            bindl1 = map
            (m:
              ",switch:on:${m.offSwitch}, exec, hyprctl keyword monitor '${m.name}, disable'"
            )
            (config.monitors);

          bindl2 = map
            (m:
              let
                resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
                position = "${toString m.x}x${toString m.y}";
              in
              ",switch:off:${m.offSwitch}, exec, hyprctl keyword monitor '${m.name},${resolution},${position},1'"
            )
            (config.monitors);
in

  /*
{
  workspace = workspaceBase ++ auxWorkspace;
}
*/



{
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
  ];

  options = {
    hyprland.enable = 
      lib.mkEnableOption "enables hyprland config";
  };

  config = lib.mkIf config.hyprland.enable {

  hyprlock.enable = true;
  hypridle.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
          exec-once = [
            "waybar"
            "hyprctl setcursor 'Capitaine Cursors (Gruvbox)' 24"
          ];
          layerrule = [
            "blur, waybar"
            "blur, rofi"
          ];
          monitor = map
            (m:
              let
                resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
                position = "${toString m.x}x${toString m.y}";
              in
              "${m.name},${if m.enabled then "${resolution},${position},1${m.rotated}" else "disable"}"
            )
            (config.monitors);
          windowrule = [
            "float, class:io.github.kaii_lb.Overskride"
            "center, class:io.github.kaii_lb.Overskride"
            "size 200 500, class:io.github.kaii_lb.Overskride"
            "float, class:org.pulseaudio.pavucontrol"
          ];      
          env = [
	    #"HYPRCURSOR_THEME,capitaine_gruvbox"
	    #"HYPRCURSOR_SIZE,24"
            "XCURSOR_THEME,Capitaine Cursors (Gruvbox)"
            "XCURSOR_SIZE,24"
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
	            color = lib.mkForce "rgba(${config.lib.stylix.colors.base04}66)";
	            color_inactive = lib.mkForce "rgba(${config.lib.stylix.colors.base00}ed)";
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
            bezier = [
              "myBezier, 0.2, 0.9, 0.1, 1.05"
              "linear, 0.0, 0.0, 1.0, 1.0"
            ];
            animation = [
              "windows, 1, 5, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 50, linear, loop"
              "fade, 1, 5, default"
              "workspaces, 1, 5, default"
              "layers, 1, 5, myBezier, fade"
            ];
          };
          dwindle = {
            pseudotile = true; 
            preserve_split = true;
          };

          workspace = workspaceBase ++ auxWorkspace;

          "$mainMod" = "SUPER";

          bind = [

            "$mainMod, Q, exec, kitty"
            "$mainMod, C, killactive"
            "$mainMod, M, exit"
            "$mainMod, V, togglefloating"
            "$mainMod, P, pseudo"
            "$mainMod, J, togglesplit"
            "$mainMod, F, fullscreen"
            "$mainMod, B, exec, firefox"
            "$mainMod, R, exec, pkill waybar && hyprctl dispatch exec waybar"
            "$mainMod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
            "$mainMod, Y, exec, yazi-window"
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
	    "$mainMod, F1, exec, audio-window"
	    "$mainMod, F2, exec, network-window"
            ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
            ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
          ];
          bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
          ];
          bindl = bindl1 ++ bindl2;
      };
  };
  };
}
