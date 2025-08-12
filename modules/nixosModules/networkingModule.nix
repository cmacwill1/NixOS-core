{ pkgs, lib, config, ... }:

{
  options = {
    networkingModule.enable =
      lib.mkEnableOption "enables general networking";
  };

  config = lib.mkIf config.networkingModule.enable {
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hosts = {
        "192.168.0.42" = ["tailscale-container"];
        "192.168.0." = [""];
        "192.168.0.224" = ["jellyfin"];
        "192.168.0.36" = ["lidarr"];
        "192.168.0.30" = ["qbittorrent"];
        "192.168.0.43" = ["docker"];
        "192.168.0.39" = ["fembox"];
      };
    };
    environment.systemPackages = with pkgs; [
      speedtest-cli
    ];
  };
}
