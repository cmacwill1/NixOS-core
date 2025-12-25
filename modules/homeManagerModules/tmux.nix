{ pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        terminal = "xterm-kitty";

        plugins = with pkgs.tmuxPlugins; [
            vim-tmux-navigator
            gruvbox
        ];

        extraConfig = ''
            set -g allow-passthrough on

            unbind C-b
            set -g prefix C-Space
            bind C-Space send-prefix

            # Vim style pane selection
            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R

            # theme
            set -g @tmux-gruvbox 'dark256'
            set-option -g status-position top
            set -g base-index 1
            set -g pane-active-border-style bg=default,fg=green
            set -g pane-border-style fg=green
        '';
    };
}
