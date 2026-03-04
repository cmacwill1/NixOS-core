{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixosModules
  ];

  networking.hostName = "desktop";

  amdgpu.enable = true;
  spacemouse.enable = true;
  sunshine.enable = true;

  system.stateVersion = "24.05";
}
