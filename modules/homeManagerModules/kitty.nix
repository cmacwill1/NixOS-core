{ lib, config, ... }:

{
  options = {
    kitty.enable =
      lib.mkEnableOption "enables kitty config";
  };

  config = lib.mkIf config.kitty.enable {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;
      confirm_os_window_close = 0;
      tab_bar_style = "powerline";
      enable_audio_bell = "no";
      };
  };
  };
}
