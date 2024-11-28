{ pkgs }:

pkgs.writeShellScriptBin "current-generation" ''
  readlink_cmd=$(which readlink)
  generation=$("$readlink_cmd /nix/var/nix/profiles/system | cut -d- -f2")
  printf '{"text": "0", "alt": "0", "tooltip": "NixOS Generation $generation", "class": "0", "percentage": "0"}'
''
