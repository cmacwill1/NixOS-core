{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixosModules
  ];

  networking.hostName = "nixtop";

  amdgpu.enable = true;
  spacemouse.enable = false;
  sunshine.enable = false;

  services.logind.lidSwitchExternalPower = "ignore";

  system.stateVersion = "24.05";
}
