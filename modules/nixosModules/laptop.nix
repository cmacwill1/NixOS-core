{ lib, config, ... }:

{
  options = {
    laptop.enable =
      lib.mkEnableOption "laptop features such as battery";
  };

  config = lib.mkIf config.laptop.enable {
    services.upower.enable = true;
  };
}
