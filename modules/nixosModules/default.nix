{ pkgs, ... }:

{
  imports = [
    ./amdgpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./common.nix
    ./generic-gpu.nix
    ./laptop.nix
    ./locale.nix
    ./networking.nix
    ./spacemouse.nix
    ./steam.nix
    ./stylix.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [
    hello
  ];
}
