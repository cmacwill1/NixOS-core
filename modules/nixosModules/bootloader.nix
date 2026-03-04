{
  pkgs,
  ...
}:

{
  /*
    # Bootloader
        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
  */
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiInstallAsRemovable = true;
    efiSupport = true;
    useOSProber = true;
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
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        };
      };
    };
  };
}
