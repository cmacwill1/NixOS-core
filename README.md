# What is this:
Personal NixOS config; allows reproducibility between personal devices.

## Example photos:
<p align="center">
    <img width="80%" src="https://github.com/cmacwill1/NixOS-core/blob/master/images/example1.png" />
</p>

<p align="center">
    <img width="80%" src="https://github.com/cmacwill1/NixOS-core/blob/master/images/example2.png" />
</p>

***Waybar buttons from [Zaneyos](https://gitlab.com/Zaney/zaneyos).***

## Notes:
- Username is currently hardcoded (will be updated eventually), so this will not be a drag and drop adaptation (`grep` + find & replace).
- Hardware is specified in the `hosts` directory. You will need to change this.
- Uses [Home Manager](https://github.com/nix-community/home-manager), [Stylix](https://github.com/nix-community/stylix), [Nixvim](https://github.com/nix-community/nixvim), and [Textfox](https://github.com/adriankarlen/textfox)
- Once necessary changes are made, rebuild from flake directory with normal `sudo nixos-rebuild switch --flake .#host`

Feel free to use any code from this as you wish. Huge thanks to [Vimjoyer](https://www.youtube.com/@vimjoyer) for helpful nix videos.

