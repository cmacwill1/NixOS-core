{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    #Hardware
    ./amdgpu.nix
    ./generic-gpu.nix
    ./laptop.nix
    ./usbModule.nix
    ./spacemouse.nix
    
    #Localization
    ./locale.nix
    ./networkingModule.nix
    ./users.nix
    
    #Software
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./homeManagerModule.nix
    ./steam.nix
    ./stylixModule.nix
    ./zsh.nix

    #testing:
    ./tailscale.nix
    ./nasModule.nix
    ./ssh.nix
  ];


  #All that follows defines host-agnostic system defaults
  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    wget
    git
    tree
    dmidecode
    mesa-demos
    gpu-viewer
    curl
    fastfetch
    htop
    wayland-utils
    brightnessctl
    qmk
    hyprshot
    vesktop
    mupdf
    lm_sensors
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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
