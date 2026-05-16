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

# Problems with nvim molten (something about the manifest; this is an AI patch fix and likely will break upon rebuild; look into if next rebuild fails to make Molten work properly)
❯ nvim --headless +UpdateRemotePlugins +qa
