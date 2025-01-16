{ inputs, ... }:

{
  # experimental settings enable.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.allowUnfree = true;

  # Configure keymap in X11
  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
