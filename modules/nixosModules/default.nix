{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    #Hardware
    ./amdgpu.nix
    ./generic-gpu.nix
    ./spacemouse.nix

    #Localization
    ./locale.nix
    ./networkingModule.nix

    #Software
    ./fonts.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./steam.nix
    ./sunshine.nix

    #testing:
    ./tailscale.nix
    ./nasModule.nix
    ./ssh.nix
  ];

  #All that follows defines host-agnostic system defaults
  environment.systemPackages = with pkgs; [
    udiskie
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
    vesktop
    mupdf
    lm_sensors
    termusic
    obs-studio
    vlc
    libvlc
    ffmpeg
    libnotify
    gimp3
    pciutils
    usbutils
    yt-dlp
    mpv
    ripgrep
    openvpn
    paraview
    gdb
    id3v2
    peco
    tplay
    wf-recorder
    rpi-imager
    cage
    jellyfin-media-player
    pdftk
    (pkgs.zathura.override {
      plugins = with pkgs.zathuraPkgs; [
        zathura_pdf_mupdf
        zathura_cb
      ];
    })
    (inkscape-with-extensions.override { inkscapeExtensions = [ inkscape-extensions.textext ]; })
    calibre
    distrobox
    btop
    fd
    lazygit
    freecad-wayland
    blender
    orca-slicer
    libreoffice
    zotero
    teams-for-linux
    openconnect
    weasis
    xwayland-satellite
    python314Packages.pylatexenc
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  programs.niri.enable = true;

  programs.fish.enable = true;

  programs.nix-ld.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  services.syncthing = {
    enable = true;
    user = "cmacwill";
    dataDir = "/home/cmacwill";
    configDir = "/home/cmacwill/.config/syncthing";
    openDefaultPorts = true;
  };

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
    };
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

  services.udisks2.enable = true;

  users.users.cmacwill = {
    isNormalUser = true;
    description = "cmacwill";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "jackaudio"
      "audio"
      "disk"
    ];
    shell = pkgs.fish;
  };

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };
}
