{ pkgs, lib, config, ... }:

{
  options = {
    audio.enable =
      lib.mkEnableOption "enables general audio support";
  };

  config = lib.mkIf config.audio.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pavucontrol
      pulsemixer
      ncpamixer
    ];
  };
}
