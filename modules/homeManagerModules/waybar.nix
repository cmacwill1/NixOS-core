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
        height = 54;
        margin = "1";
        spacing = 10;
        mode = "top";
        modules-left = [ 
          "custom/logo"
          "hyprland/window" 
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "disk"
          "memory"
          "cpu"
          "temperature"
          "clock"
        ];

        "custom/logo" = {
          return-type = "json";          
          format = "{}";
          exec = "current-generation";
          interval = 60;
          tooltip = "true";
        };

        "disk" = {
          intervel = 30;
          format = "󰋊 {percentage_used}%";
          tooltip-format = "{used} used out of {total} on \"{path}\" ({percentage_used}%)";
        };
        "memory" = {
          interval = 5;
          format = " {used}";
          tooltip-format = "{used}GiB used of {total}GiB ({percentage}%)";
        };
        "cpu" = {
          interval = 10;
          format = "  {usage}%";
        };
        "temperature" = {
          interval = 10;
        };

        "clock" = {
          timezone = "America/Indiana/Indianapolis";
          interval = 1;
          format = "  {:%I:%M:%S %p   %m/%d} ";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

       "hyprland/workspaces" = {
          format = "{name}";
          on-click = "active";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
       
          };
 
        };
        "hyprland/window" = {
          icon = true;
          icon-size = 24;
        };
      }
    ];
    style = concatStrings [
      ''
        * {
          border: none;
          font-weight: bolder;
        }


        window#waybar {
          all: unset;
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


        .modules-right {
          opacity: 1;
          border-radius: 0.5rem;
          padding: 2px 2px 2px 10px;
        }
        #custom-logo {
	  color: #${config.lib.stylix.colors.base06};
          border-radius: 6px;
          font-size: 30px;
          margin: 2px;
          padding: 0px 15px 0px 5px;
          transition: ${betterTransition};
        }
        #custom-logo:hover {
          background-color: #${config.lib.stylix.colors.base06};
	  color: #${config.lib.stylix.colors.base00};
        }

        #workspaces {
          padding: 8px 8px;
        }

        #workspaces button {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          opacity: 0.5;
          transition: ${betterTransition};
        }
        #workspaces button.active {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          transition: ${betterTransition};
          opacity: 1.0;
          min-width: 40px;
        }
        #workspaces button:hover {
          font-weight: bold;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          opacity: 0.8;
          transition: ${betterTransition};
        }
        tooltip {
          background: #${config.lib.stylix.colors.base00};
          border: 1px solid #${config.lib.stylix.colors.base08};
          border-radius: 12px;
        }
        tooltip label {
          color: #${config.lib.stylix.colors.base08};
        } 

        #window {
          color: #${config.lib.stylix.colors.base06};
          padding: 2px 5px;
          transition: ${betterTransition};
        }
        #clock {
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
