{
  pkgs,
  ...
}:
{
  gtk = {
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Capitain Cursors (Gruvbox)";
    package = pkgs.capitaine-cursors-themed;
    gtk.enable = true;
  };
}
