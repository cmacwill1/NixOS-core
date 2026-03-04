{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    amdgpu.enable = lib.mkEnableOption "enables support for AMD GPUs";
  };

  config = lib.mkIf config.amdgpu.enable {

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      nvtopPackages.amd
    ];
  };
}
