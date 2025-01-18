{ pkgs, lib, config, ... }:

{
  options = {
   bluetooth.enable =
     lib.mkEnableOption "enables general bluetooth support";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    environment.systemPackages = with pkgs; [
      overskride
    ];
  };
}
