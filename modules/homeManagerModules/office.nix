{ pkgs, lib, config, ... }:

{
  options = {
    office.enable =
      lib.mkEnableOption "enables libreoffice suite";
  };

  config = lib.mkIf config.office.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
