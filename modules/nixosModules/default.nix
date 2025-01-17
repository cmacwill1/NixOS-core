{ pkgs, inputs, ... }:

{
  imports = [
    ./amdgpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./generic-gpu.nix
    ./laptop.nix
    ./locale.nix
    ./networking.nix
    ./spacemouse.nix
    ./steam.nix
    ./stylix.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    tree
    curl
    fastfetch
    htop
    btop
    wayland-utils
    brightnessctl
    qmk
    hyprshot
    discord
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

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
