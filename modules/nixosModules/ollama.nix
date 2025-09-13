{ lib, config, ... }:

{
  options = {
   ollama.enable =
     lib.mkEnableOption "enables ollama (does not declare models)";
  };

  config = lib.mkIf config.ollama.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = "rocm";
      };
      #open-webui.enable = true; #Broken right now
    };
  };
}
