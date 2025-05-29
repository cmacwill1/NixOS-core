{ ... }:

{
  imports = [
    #Applications
    ./cad.nix
    ./firefox.nix
    ./office.nix
    ./research.nix

    #Desktop
    ./hyprland-gaming-monitor.nix
    ./hyprland.nix
    ./rofi.nix
    ./styling.nix
    ./waybar.nix
    ./wlogout/wlogout.nix

    #Programs
    ./git.nix
    ./direnv.nix
    ./kitty.nix
    ./nixvim.nix
    ./yazi.nix
    ./screenshotter.nix
    ./scripts.nix
    ./minecrafClient.nix
    ./fish.nix
    ./starship.nix
  ];
  
  home.sessionVariables.EDITOR = "nvim";

  services.mako = {
    enable = true;
    settings = {
      max-history = 15;
      max-visible = 15;
      history = 1;
      default-timeout = 5000;
      ignore-timeout = 1;
      border-size = 2;
      border-radius = 5;
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      proc_tree = true;
    };
  };
}
