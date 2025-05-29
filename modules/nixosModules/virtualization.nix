{ lib, config, ... }:

{
  options = {
    virtualisationModule.enable =
      lib.mkEnableOption "enables support for virt-manager";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["your_username"];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
  };
}
