{ config, ... }:

{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/run/mount/music";
      user = "cmacwill";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "Pipewire Output"
        }
        audio_output {
          type "fifo"
          name "my_fifo"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
        }
      '';
    };
  };

  # Important
  systemd = {
    services = {
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };
}
