{ pkgs, ... }:

{
  programs.rmpc = {
    enable = true;
  };

  home = {
    file = {
      ".config/rmpc/config.ron".source = ./config.ron;
      ".config/rmpc/themes/theme.ron".source = ./tmp.ron;
    };
    packages = with pkgs; [
      cava
    ];
  };
}
