{ pkgs }:

pkgs.writeShellScriptBin "video-picker" ''
  vid_dir="/home/cmacwill/conf-videos/"
  selected=$(find "$vid_dir" -type f -name '*' -exec basename {} \; | rofi -dmenu -p "Play video:")

  if [ -n "$selected" ]; then
    mpv --fs --loop "$vid_dir/$selected"
  fi
''
