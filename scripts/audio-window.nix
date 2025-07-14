{ pkgs }:

pkgs.writeShellScriptBin "audio-window" ''
  hyprctl dispatch exec [float] "kitty -- fish -c 'pulsemixer'" &&
  sleep 0.1 &&
  hyprctl dispatch resizeactive exact 50% 50% &&
  hyprctl dispatch centerwindow
''
