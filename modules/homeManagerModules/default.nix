{ pkgs, ... }:

{
  imports = [
    #Applications
    ./cad.nix
    ./firefox.nix
    ./office.nix
    ./research.nix

    #Desktop
    ./monitors.nix
    ./hyprland.nix
    ./rofi.nix
    ./styling.nix
    ./waybar.nix

    #Programs
    ./git.nix
    ./direnv.nix
    ./kitty.nix
    ./fzf.nix
    ./nixvim/nixvim.nix
    ./newsboat.nix
    ./rmpc
    ./yazi.nix
    ./screenshotter.nix
    ./scripts.nix
    ./minecrafClient.nix
    ./fish.nix
    ./starship.nix
    ./ssh.nix
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

  programs.tmux = {
    enable = true;
  };

  programs.cava = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
  };

  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [
    udiskie
    bluebubbles
  ];

  programs.btop = {
    enable = true;
    settings = {
      proc_tree = true;
    };
  };
}
