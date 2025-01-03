{ pkgs }:

pkgs.writeShellScriptBin "purdue-vpn" ''
  sudo openconnect --protocol=anyconnect https://webvpn2.purdue.edu
''
