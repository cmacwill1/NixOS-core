{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  fileSystems."NAS" = {
    device = "100.ip.addr.here/hostSharePoint";
    fsType = "nfs";
    mountPoint = "/home/USER/clientSharePoint";
    options = [ "?" ];
  };
}
