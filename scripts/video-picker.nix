{ pkgs }:

pkgs.writeShellScriptBin "video-picker" ''
  vid_dir="/run/mount/cmacwillNAS/chicken-data/videos/"
  selected=$(find "$vid_dir" -type f -name '*.mp4' -exec basename {} \; | rofi -dmenu -p "Play video:")

  if [ -n "$selected" ]; then
    mpv --fs "$vid_dir/$selected"
  fi
''
