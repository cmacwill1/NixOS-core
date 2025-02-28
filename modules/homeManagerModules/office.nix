{ pkgs, lib, config, ... }:

{
  options = {
    office.enable =
      lib.mkEnableOption "enables libreoffice suite";
  };

  config = lib.mkIf config.office.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      libreoffice
      hunspell
      vistafonts
    ];
  };
}
