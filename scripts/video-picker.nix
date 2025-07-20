{ pkgs }:

pkgs.writeShellScriptBin "video-picker" ''
  set vid_dir /run/mount/cmacwillNAS/chicken-data/videos/
  set choices (find $vid_dir -type f -name '*.mp4' -exec basename {} \;)
  set selected (printf '%s\n' $choices | rofi -dmenu -p "Play video:")
  if test -n "$selected"
      set full_path "$vid_dir/$selected"
      mpv --fs "$full_path"
  end
''
