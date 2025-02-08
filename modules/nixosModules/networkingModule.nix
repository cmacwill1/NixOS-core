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
    networking.networkmanager.enable = true;
    environment.systemPackages = with pkgs; [
      speedtest-cli
    ];
  };
}
