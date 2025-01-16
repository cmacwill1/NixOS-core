{ pkgs, ... }:

{
  home.packages = [
    (import ../../scripts/current-generation.nix {inherit pkgs; })
    (import ../../scripts/purdue-vpn.nix {inherit pkgs; })
  ];
}
