{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      fira-code
      fira-code-symbols
      corefonts
      vista-fonts
    ];
  };
}
