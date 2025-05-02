{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  services.rpcbind.enable = true; # needed for NFS
  systemd.mounts = [
  {
    what = "100.101.227.116:/mnt/Main_Core/Core_1/Charles/cmacwill";
    where = "/run/mount/jmacwillNAS"; 
    type = "nfs";
    options = "noatime";
  }

  {
    what = "100.104.103.21:/mnt/zpool/user/cmacwill";
    where = "/run/mount/cmacwillNAS"; 
    type = "nfs";
    options = "noatime";
  }
  ];

  systemd.automounts = [
  {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/run/mount/jmacwillNAS"; 
  }

  {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/run/mount/cmacwillNAS"; 
  }
  ];
}
