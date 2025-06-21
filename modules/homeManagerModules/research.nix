{ pkgs, lib, config, ... }:

{
  options = {
    research.enable =
      lib.mkEnableOption "enables research packages";
  };

  config = lib.mkIf config.research.enable {
    home.packages = with pkgs; [
      zotero
      teams-for-linux
      openconnect
      x2goclient
      weasis
    ];
  };
}
