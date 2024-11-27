{pkgs, lib, config, ... }:

let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
with lib;
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 10;
        margin = "1";
        spacing = 10;
        mode = "top";
        modules-left = [ 
          "custom/logo"
          "hyprland/workspaces" 
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "disk"
          "memory"
          "cpu"
          "temperature"
          "clock"
        ];

        "custom/logo" = {
          format = "";
          icon-size = 40;
          tooltip = false;
        };

        "disk" = {
          intervel = 30;
          format = "󰋊 {percentage_used}%";
          tooltip-format = "{used} used out of {total} on \"{path}\" ({percentage_used}%)";
        };
        "memory" = {
          interval = 10;
          format = " {used}";
          tooltip-format = "{used}GiB used of {total}GiB ({percentage}%)";
        };
        "cpu" = {
          interval = 10;
          format = " {usage}%";
        };
        "temperature" = {
          interval = 10;
        };
        "clock" = {
	        timezone = "America/Indiana/Indianapolis";
          interval = 1;
          format = ''{:%H:%M:%S}'';
        };
        
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = [1 2 3 4 5 6 7 8 9 10];
          };
	        icon-size = 32;
          spacing = 16;
        };
        "hyprland/window" = {
          icon = true;
          icon-size = 22;
        };
      }
    ];
    style = concatStrings [
      ''
        window#waybar {
          all: unset;
          font-family: "JetBrains Mono";
          background-color: rgba(0,0,0,0.01);
          font-size: 1rem;
          border-radius: 10px;
        }
        window#waybar > box {
          border-style: solid;
          border-width: 2px;
          border-color: #${config.lib.stylix.colors.base0A};
          border-radius: 10px;
          margin: 4px;
          background-color: rgba(32, 32, 32, 0.5);
          box-shadow: 0 0 2px 2px #${config.lib.stylix.colors.base00};
        }
        .modules-left, .modules-center {
          opacity: 1;
          padding: 2px;
        }
        .modules-right {
          opacity: 1;
          border-radius: 0.5rem;
          padding: 2px 2px 2px 10px;
        }
        #workspaces { 
          border-radius: 0.5rem;
          padding: 2px 2px;
        }
        #workspaces button {
          color: #FFFFFF;
    	    transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
          font-size: 1rem;
          padding: 0 0 0 0;
        }      
        #workspaces button.active {
	        color: #F7C01A;
        }
        #window {
          padding: 2px 5px;
        }
        #clock {
          font-weight: bolder;
          border-radius: 0.5rem;
          padding: 0 3px 0 0;
          color: #${config.lib.stylix.colors.base0F};
        }
        #memory {
          color: #${config.lib.stylix.colors.base0C};
          padding: 0 0.6rem 0 0;
        } 
        #disk {
          color: #${config.lib.stylix.colors.base0B};    
          padding: 0 0.6rem 0 0;
        } 
        #cpu {
          color: #${config.lib.stylix.colors.base0D};
          padding: 0 0.6rem 0 0;
        }
        #temperature {
          padding: 0 0.6rem 0 0;
          color: #${config.lib.stylix.colors.base0E};
        }
      ''
    ];
  };
}
