{ config, ... }:

{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/home/cmacwill/Music";
      user = "cmacwill";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "Pipewire Output"
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
