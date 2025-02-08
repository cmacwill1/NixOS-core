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
    ./kitty.nix
    ./nixvim.nix
    ./yazi.nix
    ./screenshotter.nix
    ./scripts.nix
  ];
  
  home.sessionVariables.EDITOR = "nvim";

  programs.btop = {
    enable = true;
    settings = {
      proc_tree = true;
    };
  };
}
