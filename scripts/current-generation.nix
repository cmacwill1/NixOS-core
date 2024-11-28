{ pkgs }:

pkgs.writeShellScriptBin "current-generation" ''
  generation=$(readlink /nix/var/nix/profiles/system | cut -d- -f2)
  printf '{"text": "%s", "tooltip": "NixOS Generation %s"}' "󱄅" "$generation"
''
