{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    ./hardware/amdgpu.nix
    ./software/audio.nix
    ./software/bluetooth.nix
    ./software/bootloader.nix
    ./hardware/generic-gpu.nix
    ./hardware/laptop.nix
    ./localization/locale.nix
    ./localization/networkingModule.nix
    ./hardware/spacemouse.nix
    ./software/steam.nix
    ./software/stylixModule.nix
    ./localization/users.nix
    ./software/zsh.nix
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
