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
