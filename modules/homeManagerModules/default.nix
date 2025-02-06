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
    ./screenshotter.nix
    ./scripts.nix
  ];

  programs.btop = {
    enable = true;
    settings = {
      proc_tree = true;
    };
  };

  programs.lf = {
    enable = true;
  };
}
