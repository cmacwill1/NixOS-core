{ lib, config, pkgs, ... }:

{
  options = {
    minecraftClient.enable = lib.mkEnableOption "enables minecraft client";
  };

  config = lib.mkIf config.minecraftClient.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
