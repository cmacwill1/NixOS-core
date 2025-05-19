{ lib, config, ... }:

{
  options = {
    sunshine.enable =
      lib.mkEnableOption "enables sunshine server";
  };

  config = lib.mkIf config.sunshine.enable {
    services.sunshine.enable = true;
  };
}
