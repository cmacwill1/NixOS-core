{ pkgs }:

pkgs.writeShellScriptBin "current-generation" ''
  echo `readlink /nix/var/nix/profiles/system | cut -d- -f2`'
''
