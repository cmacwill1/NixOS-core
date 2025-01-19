{ lib, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = lib.mkForce 0.5;
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;
      confirm_os_window_close = 0;
      tab_bar_style = "fade";
      };
  };
}
