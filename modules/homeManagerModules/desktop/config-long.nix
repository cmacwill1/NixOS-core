{ lib, config, ... }:

{
  options = {
    config-long.enable = 
      lib.mkEnableOption "enables config-long";
  };

  config = lib.mkIf config.config-long.enable {
    home.file.".config/rofi/config-long.rasi".text = ''
      @import "~/.config/rofi/config.rasi" 
      window {
        width: 50%;
      }
      entry {
        placeholder: "🔎 Search       ";
      }
      listview {
        columns: 1;
        lines: 8;
        scrollbar: true;
      }
    '';
  };
}
