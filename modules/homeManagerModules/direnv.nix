{ ... }:

{
  programs.direnv = {
    enable = true;
    #enableFishIntegration = true; wtf?
    nix-direnv.enable = true;
  };
}
