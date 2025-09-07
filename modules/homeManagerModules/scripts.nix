{ pkgs, lib, config, ... }:

{
  options = {
    scripts.enable = 
      lib.mkEnableOption "enables scripts";
  };

  config = lib.mkIf config.scripts.enable {
  home.packages = [
    (import ../../scripts/current-generation.nix {inherit pkgs; })
    (import ../../scripts/audio-window.nix {inherit pkgs; })
    (import ../../scripts/network-window.nix {inherit pkgs; })
    (import ../../scripts/yazi-window.nix {inherit pkgs; })
    (import ../../scripts/yt-mp3.nix {inherit pkgs; })
    (import ../../scripts/video-picker.nix {inherit pkgs; })
  ];
  };
}
