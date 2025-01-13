{ pkgs, ... }:

{
  enviroment.systemPackages = with pkgs; [
    freecad-wayland
    kicad
    blender
    bambu-studio
  ];
  hardware.spacenavd.enable = true;
}

