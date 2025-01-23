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
  stylixModule.enable = true;
  zsh.enable = true;
  users.enable = true;

  #Home manager stuff; inherit home configuration for cmacwill
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      "cmacwill" = import ./home.nix;
    };
    useGlobalPkgs = true;
    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
    ];
  };

  system.stateVersion = "24.05";
}
