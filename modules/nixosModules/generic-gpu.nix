{ lib, config, ... }:

{
  options = {
    generic-gpu.enable = 
      lib.mkEnableOption "enables general GPU support (superceeded by proper GPU.nix)";
  };

  config = lib.mkIf config.generic-gpu.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
