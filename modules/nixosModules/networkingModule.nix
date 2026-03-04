{
  pkgs,
  ...
}:

{
  networking = {
    networkmanager.enable = true;
    hosts = {
      "192.168.0.42" = [ "tailscale-container" ];
      "192.168.0." = [ "" ];
      "192.168.0.224" = [ "jellyfin" ];
      "192.168.0.36" = [ "lidarr" ];
      "192.168.0.30" = [ "qbittorrent" ];
      "192.168.0.43" = [ "docker" ];
      "192.168.0.39" = [ "fembox" ];
    };
  };
  environment.systemPackages = with pkgs; [
    speedtest-cli
  ];
}
