{ ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultCommand = "fd --type f";
    defaultOptions = [
      "--border='rounded' --border-label='' --preview-window='border-rounded' --prompt='> '"
      "--marker='>' --pointer='◆' --separator='─' --scrollbar='│'"
    ];
  };
}
