{ pkgs, lib, config, ... }:

{
  options = {
    bootloader.enable =
      lib.mkEnableOption "enables general bootloader / greeter";
  };

  config = lib.mkIf config.bootloader.enable  {
/*
# Bootloader
    boot.loader = { 
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

*/
  boot.loader.grub= { 
    enable = true;
    devices = [ "nodev" ];
    efiInstallAsRemovable = true;
    efiSupport = true;
    useOSProber = true;
    #theme = pkgs.nixos-grub2-theme;
  };

    # Install greeter
    environment.systemPackages = with pkgs; [
      tuigreet
    ];

    # Configure greeter
    services = {
      greetd = {
        enable = true;
        settings = {
          default_session = {
            user = "cmacwill";
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          };
        };
      };
    };
  };
}
