{ lib, config, ... }:

{
  options = {
    spacemouse.enable = 
      lib.mkEnableOption "enables spacemouse hardware support";
  };

  config = lib.mkIf config.spacemouse.enable {
    hardware.spacenavd.enable = true;
  };
}
