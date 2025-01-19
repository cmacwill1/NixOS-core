{ lib, config, ... }:

{
  options = {
    config-emoji.enable = 
      lib.mkEnableOption "enables rofi emoji";
  };

  config = lib.mkIf config.config-emoji.enable {
    home.file.".config/rofi/config-emoji.rasi".text = ''
      @import "~/.config/rofi/config-long.rasi"
      entry {
        width: 45%;
        placeholder: "🔎 Search Emoji's 👀";
      }
    '';
  };
}
