{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  fileSystems."/home/cmacwill/nasTest" = {
    device = "truenas-scale:/mnt/Main_Core/Core_1/Charles/cmacwill";
    fsType = "nfs";
  };
}
