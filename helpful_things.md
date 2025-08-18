# See what is going to be built:
```bash
sudo nixos-rebuild dry-build --verbose --flake .#host
```
- was helpful for diagnosing getting webkitgtk .drv path

# Shows dependancies of derivations
```bash
nix-store -q --referrers <path>
```
- Was helpful for finding what was causing webkitgtk derivation to build

