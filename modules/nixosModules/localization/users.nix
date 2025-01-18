{ pkgs, lib, config, ... }:

{
  options = {
    users.enable =
      lib.mkEnableOption "user support";
  };

  config = lib.mkIf config.users.enable {
    users.users.cmacwill = {
      isNormalUser = true;
      description = "cmacwill";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
 };
}
