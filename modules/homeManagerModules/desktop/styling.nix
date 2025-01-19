{ pkgs, ... }:

{
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-applications-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-applications-prefer-dark-theme = 1;
    };
  };
}
