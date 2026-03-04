{ ... }:

{
  imports = [
    #Applications
    ./firefox.nix
    ./git.nix

    #Desktop
    ./monitors.nix
    ./noctalia.nix
    ./styling.nix

    #Programs
    ./kitty.nix
    ./mpd.nix
    ./fzf.nix
    ./nixvim/nixvim.nix
    ./rmpc
    ./tmux.nix
    ./yazi.nix
    ./fish.nix
    ./starship.nix
    ./ssh.nix
  ];

  home.sessionVariables.EDITOR = "nvim";

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
  };
}
