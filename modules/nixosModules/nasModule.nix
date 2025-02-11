{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  services.rpcbind.enable = true; # needed for NFS
  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      options = "noatime";
    };
    what = "truenas-scale:/mnt/Main_Core/Core_1/Charles/cmacwill";
    where = "/home/cmacwill/externalNetworkDrives/jmacwillNAS";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/home/cmacwill/externalNetworkDrives/jmacwillNAS";
  }];
}
