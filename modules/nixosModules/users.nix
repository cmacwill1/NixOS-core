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
    ];
    shell = pkgs.fish;
  };
}
