{ lib, config, ... }:

{
  options = {
    git.enable =
      lib.mkEnableOption "enables git configuration";
  };

  config = lib.mkIf config.git.enable {
  programs.git = {
    enable = true;
    userName = "cmacwill1";
    userEmail = "charles.macwilliams@gmail.com";
    extraConfig.credential.helper = "store";
  };
  };
}
