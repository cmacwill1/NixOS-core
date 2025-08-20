{ pkgs, lib, config, ... }:

{
  options = {
    cad.enable =
      lib.mkEnableOption "enables CAD programs";
  };

  config = lib.mkIf config.cad.enable {

  home.packages = with pkgs; [
      freecad-wayland
      orca-slicer
      kicad
      blender
    ];
  };
}

