{ pkgs }:

pkgs.writeShellScriptBin "yazi-window" ''
  hyprctl dispatch exec [float] "kitty -- fish -c 'yazi'" &&
  sleep 0.1 &&
  hyprctl dispatch resizeactive exact 80% 80% &&
  hyprctl dispatch centerwindow
''
