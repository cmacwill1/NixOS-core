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

  networking.hostName = "desktop"; 

  amdgpu.enable = true;
  audio.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  generic-gpu.enable = false;
  laptop.enable = false;
  locale.enable = true;
  networkingModule.enable = true;
  spacemouse.enable = false;
  steam.enable = true;
  sunshine.enable = true;
  stylixModule.enable = true;
  zsh.enable = false;

  homeManagerModule = {
    enable = true;
    variation = "maximal";
  };

  system.stateVersion = "24.05";
}
