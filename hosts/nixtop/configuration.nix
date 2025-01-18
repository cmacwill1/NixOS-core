{
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  amdgpu.enable = true;
  audio.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  generic-gpu.enable = false;
  laptop.enable = true;
  locale.enable = true;
  networkingModule.enable = true;
  spacemouse.enable = false;
  steam.enable = false;
  stylixModule.enable = true;
  zsh.enable = true;
  users.enable = true;


  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      "cmacwill" = import ./home.nix;
    };
    useGlobalPkgs = true;
  };

  system.stateVersion = "24.05";
}
