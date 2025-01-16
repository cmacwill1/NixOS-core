{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixosModules/locale.nix
    ../../modules/nixosModules/networking.nix
    ../../modules/nixosModules/audio.nix
    ../../modules/nixosModules/bluetooth.nix
    ../../modules/nixosModules/bootloader.nix
    ../../modules/nixosModules/amdgpu.nix
    ../../modules/nixosModules/zsh.nix
  ];
 
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Configure keymap in X11
  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    upower.enable = true;
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cmacwill = {
    isNormalUser = true;
    description = "cmacwill";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../wallpapers/ghibli-background-1.jpg;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "cmacwill" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.thunar.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    tree
    curl
    greetd.tuigreet
    fastfetch
    htop
    btop
    wayland-utils
    brightnessctl
    zotero
    obsidian
    openconnect
    x2goclient
    blender
    kicad
    steam
    qmk
    hyprshot
    discord
    zsh-powerlevel10k
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
