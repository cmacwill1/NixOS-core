{ ... }:

{
  imports = [
    #Applications
    ./applications/cad.nix
    ./applications/firefox.nix
    ./applications/office.nix
    ./applications/research.nix

    #Desktop
    ./desktop/config-emoji.nix
    ./desktop/config-long.nix
    ./desktop/hyprland-gaming-monitor.nix
    ./desktop/hyprland.nix
    ./desktop/rofi.nix
    ./desktop/styling.nix
    ./desktop/waybar.nix
    ./desktop/wlogout/wlogout.nix

    #Programs
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/nvim/nvim.nix
    ./programs/scripts.nix
  ];
}
