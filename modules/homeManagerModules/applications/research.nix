{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    zotero
    openconnect
    x2goclient
  ];
}
