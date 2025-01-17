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
    ../../modules/nixosModules/steam.nix
    ../../modules/nixosModules/amdgpu.nix
    ../../modules/nixosModules/zsh.nix
    ../../modules/nixosModules/common.nix
    ../../modules/nixosModules/stylix.nix
  ];

  steam.enable = false;






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

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "cmacwill" = import ./home.nix;
    };
    useGlobalPkgs = true;
  };



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
  
  system.stateVersion = "24.05";
}
