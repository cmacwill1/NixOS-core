{ ... }:

{
  programs.direnv = {
    enable = true;
    silent = true;
    #enableFishIntegration = true; wtf?
    nix-direnv.enable = true;
  };
}
