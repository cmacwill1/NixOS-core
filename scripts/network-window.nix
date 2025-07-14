{ pkgs }:

pkgs.writeShellScriptBin "network-window" ''
  hyprctl dispatch exec [float] "kitty -- fish -c 'nmtui'" &&
  sleep 0.1 &&
  hyprctl dispatch resizeactive exact 50% 50% &&
  hyprctl dispatch centerwindow
''
