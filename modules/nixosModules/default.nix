{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    #Hardware
    ./hardware/amdgpu.nix
    ./hardware/generic-gpu.nix
    ./hardware/laptop.nix
    ./hardware/spacemouse.nix
    
    #Localization
    ./localization/locale.nix
    ./localization/networkingModule.nix
    ./localization/users.nix
    
    #Software
    ./software/audio.nix
    ./software/bluetooth.nix
    ./software/bootloader.nix
    ./software/steam.nix
    ./software/stylixModule.nix
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
    wayland-utils
    brightnessctl
    qmk
    hyprshot
    vesktop
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
