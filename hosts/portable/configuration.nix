{
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixosModules
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "portable"; 

  amdgpu.enable = true;
  audio.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  generic-gpu.enable = true;
  laptop.enable = false;
  locale.enable = true;
  networkingModule.enable = true;
  spacemouse.enable = false;
  steam.enable = false;
  stylixModule.enable = true;
  zsh.enable = true;
  users.enable = true;

  home-manager = {
    users = {
      "cmacwill" = import ./home.nix;
    };
  };

  system.stateVersion = "24.05";
}
