{ pkgs, ... }:

{
  programs.rmpc = {
    enable = true;
  };
  home.file.".config/rmpc/config.ron".source = ./config.ron;
  home.file.".config/rmpc/themes/theme.ron".source = ./tmp.ron;
}
