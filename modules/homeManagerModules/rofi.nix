{ pkgs, lib, config, ... }:

{
  options = {
    rofi.enable = 
      lib.mkEnableOption "enables rofi";
  };

  config = lib.mkIf config.rofi.enable {

  home.packages = with pkgs; [
    rofi-power-menu
  ];

  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "drun,ssh,power-menu:rofi-power-menu";
        show-icons = true;
        icon-theme = "Papirus";
        location = 0;
	font = "JetBrainsMono Nerd Font 12";
      };

      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          "*" = {
            bg = mkLiteral "#${config.lib.stylix.colors.base00}CC";
            bg-alt = mkLiteral "#${config.lib.stylix.colors.base09}";
            foreground = mkLiteral "#${config.lib.stylix.colors.base01}";
            selected = mkLiteral "#${config.lib.stylix.colors.base0A}";
            active = mkLiteral "#${config.lib.stylix.colors.base0A}";
            text-selected = mkLiteral "#${config.lib.stylix.colors.base00}";
            text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
            border-color = mkLiteral "#${config.lib.stylix.colors.base0A}";
            urgent = mkLiteral "#${config.lib.stylix.colors.base0E}";
          };
          "window" = {
            width = mkLiteral "25%";
            transparency = "real";
            orientation = mkLiteral "vertical";
            cursor = mkLiteral "default";
            spacing = mkLiteral "0px";
            border = mkLiteral "2px";
            border-color = "@border-color";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@bg";
          };
          "mainbox" = {
            padding = mkLiteral "0px";
            enabled = true;
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
              "inputbar"
              "listbox"
            ];
            background-color = mkLiteral "transparent";
          };
          "inputbar" = {
            enabled = true;
            padding = mkLiteral "0px";
            margin = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            border-radius = "10px";
            orientation = mkLiteral "horizontal";
            children = map mkLiteral [
              "entry"
            ];
          };
          "entry" = {
            enabled = true;
            expand = true;
            padding = mkLiteral "10px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
            cursor = mkLiteral "text";
            placeholder = " Search ";
            placeholder-color = mkLiteral "inherit";
          };
          "listbox" = {
            spacing = mkLiteral "10px";
            padding = mkLiteral "10px 10px 10px 10px";
            background-color = mkLiteral "transparent";
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
#              "message"
              "listview"
            ];
          };
         "listview" = {
            enabled = true;
            columns = 1;
            lines = 6;
            cycle = true;
            dynamic = true;
            scrollbar = false;
            layout = mkLiteral "vertical";
            reverse = false;
            fixed-height = true;
            fixed-columns = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "button" = {
            width = mkLiteral "5%";
            padding = mkLiteral "10px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@text-selected";
            text-color = mkLiteral "@text-color";
            cursor = mkLiteral "pointer";
          };
          "button selected" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "scrollbar" = {
            width = mkLiteral "4px";
            border = 0;
            handle-color = mkLiteral "@border-color";
            handle-width = mkLiteral "8px";
            padding = 0;
          };
          "element" = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "10px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            cursor = mkLiteral "pointer";
          };
          "element normal.normal" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
          "element normal.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@foreground";
          };
          "element normal.active" = {
            background-color = mkLiteral "@active";
            text-color = mkLiteral "@foreground";
          };
          "element selected.normal" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.urgent" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element selected.active" = {
            background-color = mkLiteral "@urgent";
            text-color = mkLiteral "@text-selected";
          };
          "element alternate.normal" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.urgent" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element alternate.active" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
          };
          "element-icon" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
            size = mkLiteral "36px";
            cursor = mkLiteral "inherit";
          };
          "element-text" = {
            background-color = mkLiteral "transparent";
            font = "JetBrainsMono Nerd Font Mono 12";
            text-color = mkLiteral "inherit";
            cursor = mkLiteral "inherit";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "message" = {
            background-color = mkLiteral "transparent";
            border = mkLiteral "0px";
          };
          "textbox" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "error-message" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "@bg-alt";
            text-color = mkLiteral "@bg";
          };
        };
    };
  };
  };
}
