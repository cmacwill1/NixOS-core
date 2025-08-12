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
    ./mpd.nix
    ./steam.nix
    ./sunshine.nix
    ./stylixModule.nix
    ./zsh.nix
    ./virtualization.nix

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
    hyprshot
    vesktop
    mupdf
    zathura
    lm_sensors
    termusic
    obs-studio
    vlc
    libvlc
    #davinci-resolve
    ffmpeg
    jellyfin-media-player
    antimicrox
    libnotify
    bat
    inkscape
    gimp3
    spacenav-cube-example
    spacenavd
    libspnav
    pciutils
    usbutils
    openrgb
    whatsie
    xsettingsd
    xorg.xrdb
    yt-dlp
    mpv
    ripgrep
    openvpn
    paraview
    gdb
    id3v2
    peco
  ];
  
  programs.fish.enable = true;

  hardware.spacenavd.enable = true;

  services.hardware.openrgb.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg = {
    icons = {
      enable = true;
      fallbackCursorThemes = [ "Capitaine Cursors (Gruvbox)" ];
    };
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal
      ];
      configPackages = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal
      ];
    };
  };


  security.pam.services.hyprlock = { };


  # experimental settings enable.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];
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
