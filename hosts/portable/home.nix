{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cmacwill";
  home.homeDirectory = "/home/cmacwill";
 
  imports = [
    ../../modules/homeManagerModules/hyprland.nix
    ../../modules/homeManagerModules/kitty.nix
    ../../modules/homeManagerModules/waybar.nix
    ../../modules/homeManagerModules/rofi.nix
    ../../modules/homeManagerModules/config-emoji.nix
    ../../modules/homeManagerModules/config-long.nix 
    ../../modules/homeManagerModules/wlogout/wlogout.nix
    ../../modules/homeManagerModules/nvim/nvim.nix
    ../../modules/homeManagerModules/git.nix
    ../../modules/homeManagerModules/office.nix
  ];

  #Scripts
  home.packages = [
    (import ../../scripts/current-generation.nix {inherit pkgs; })
    (import ../../scripts/purdue-vpn.nix {inherit pkgs; })
  ];

  programs.git = {
    enable = true;
    userName = "cmacwill1";
    userEmail = "charles.macwilliams@gmail.com";
    extraConfig.credential.helper = "store";
  };

  
  programs = {
    firefox = {
      enable = true;
    };
  };
  home.stateVersion = "24.05"; 

  #Styling
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-applications-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-applications-prefer-dark-theme = 1;
    };
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cmacwill/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
