{ pkgs, lib, config, ... }:

{
  options = {
    bootloader.enable =
      lib.mkEnableOption "enables general bootloader / greeter";
  };

  config = lib.mkIf config.bootloader.enable  {
    # Bootloader
    boot.loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Install greeter
    environment.systemPackages = with pkgs; [
      greetd.tuigreet
    ];

    # Configure greeter
    services = {
      greetd = {
        enable = true;
        vt = 3;
        settings = {
          default_session = {
            user = "cmacwill";
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          };
        };
      };
    };
  };
}
