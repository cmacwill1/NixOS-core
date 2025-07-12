{ lib, config, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
      options = {
        name = mkOption {
          type = types.str;
          example = "DP-1";
        };
        width = mkOption {
          type = types.int;
          example = 1920;
        };
        height = mkOption {
          type = types.int;
          example = 1080;
        };
        refreshRate = mkOption {
          type = types.int;
          default = 60;
        };
        x = mkOption {
          type = types.int;
          default = 0;
        };
        y = mkOption {
          type = types.int;
          default = 0;
        };
        enabled = mkOption {
          type = types.bool;
          default = true;
        };
        rotated = mkOption {
          type = types.str;
          example = ",transform,1"; #start with , to properly append. This is dumb but it works.
          default = ""; #See https://deepwiki.com/hyprwm/hyprland-wiki/3.5-monitors-and-workspaces#rotation
        };
        showWaybar = mkOption {
          type = types.bool;
          default = true;
        };
      };
    });
    default = [ ];
  };
}

