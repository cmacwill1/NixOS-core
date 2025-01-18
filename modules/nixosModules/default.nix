{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    ./amdgpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./generic-gpu.nix
    ./laptop.nix
    ./locale.nix
    ./networkingModule.nix
    ./spacemouse.nix
    ./steam.nix
    ./stylixModule.nix
    ./users.nix
    ./zsh.nix
  ];
  
  #All that follows defines host-agnostic system defaults
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
