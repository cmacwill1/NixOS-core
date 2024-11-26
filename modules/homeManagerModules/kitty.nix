{lib, config, ... }:
with lib;
{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.5;
      foreground = "#E8E1CA";
      background = "#24160D";
      selection_foreground = "#24160D";
      selection_background = "#FFF82E";
      cursor = "#F7E9C3";
      cursor_text_color = "#24160D";
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;
      confirm_os_window_close = 0;
    };
  };
}
