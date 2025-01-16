{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad-wayland
    kicad
    blender
    bambu-studio
  ];
}

