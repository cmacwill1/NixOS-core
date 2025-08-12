{ lib, config, pkgs, ... }:

{
  options = {
    amdgpu.enable =
      lib.mkEnableOption "enables support for AMD GPUs";
  };

  config = lib.mkIf config.amdgpu.enable {

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
     /*
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
      */
    };

    #    services.xserver.videoDrivers = ["amdgpu"];

    environment.systemPackages = with pkgs; [
      nvtopPackages.amd
    ];
  };
}
