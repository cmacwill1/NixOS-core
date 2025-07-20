{ pkgs }:

pkgs.writeShellScriptBin "yt-mp3" ''
  yt-dlp -x\
  --audio-format mp3\
  -o "%(title)s.%(ext)s"\
  --parse-metadata "playlist_index:%(track_number)s"\
  --embed-metadata --embed-thumbnail -v --convert-thumbnail jpg --ppa "EmbedThumbnail+ffmpeg_o:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\""\
  --exec ffprobe $1
''
