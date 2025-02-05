{ pkgs, lib, config, ... }:

{
  options = {
    scripts.enable = 
      lib.mkEnableOption "enables scripts";
  };

  config = lib.mkIf config.scripts.enable {
  home.packages = [
    (import ../../../scripts/current-generation.nix {inherit pkgs; })
    (import ../../../scripts/purdue-vpn.nix {inherit pkgs; })
  ];
  };
}
