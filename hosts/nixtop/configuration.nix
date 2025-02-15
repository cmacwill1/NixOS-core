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

  networking.hostName = "nixtop"; 

  amdgpu.enable = true;
  audio.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  generic-gpu.enable = false;
  laptop.enable = true;
  locale.enable = true;
  networkingModule.enable = true;
  spacemouse.enable = false;
  steam.enable = true;
  stylixModule.enable = true;
  zsh.enable = true;
  users.enable = true;

  homeManagerModule = {
    enable = true;
    variation = "medial";
  };

  system.stateVersion = "24.05";
}
