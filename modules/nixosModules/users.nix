{ pkgs, ... }:

{
  users.users.cmacwill = {
    isNormalUser = true;
    description = "cmacwill";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "jackaudio"
      "audio"
      "disk"
    ];
    shell = pkgs.fish;
  };
}
