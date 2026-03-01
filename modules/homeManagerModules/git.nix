{ lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enables git configuration";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "cmacwill1";
          email = "charles.macwilliams@gmail.com";
        };
        credential.helper = "store";
      };
    };
  };
}
