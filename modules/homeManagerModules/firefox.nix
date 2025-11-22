{ lib, config, pkgs, inputs, ... }:

{
  options = {
    firefox.enable =
      lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {

    textfox = {
      enable = true;
      profile = "cmacwill";
      config = {
        background = {
          color = "#${config.lib.stylix.colors.base00}";
        };
        border = {
          color = "#${config.lib.stylix.colors.base02}";
          width = "2px";
          transition = "0.2s ease";
          radius = "5px";
        };
	tabs = {
	  vertical = {
	    enable = true;
	    margin = "5px";
	  };
	  horizontal.enable = false;
	};
        displayWindowControls = false;
        displayNavButtons = true;
        displayUrlbarIcons = true;
        displaySidebarTools = true;
        displayTitles = false;
        newtabLogo = "     /\\  \\‾\\  /\\    \\A     \\ \\  \\ \\/ /    \\A  /‾‾‾  ‾‾‾\\  / /\\  \\A   ‾‾/‾/‾‾‾‾\\ \\/ /  \\A ___/ /      \\/ /‾‾⟩\\A⟨__  /\\      / /‾‾‾ \\A  / /\\ \\____/_/__   \\A  \\/ /  \\___  ___/  \\A    / /\\ \\  \\ \\     \\A    \\/  \\_\\  \\/     \\A";
      };
  };

    programs.firefox = {
      enable = true;
      profiles.cmacwill = {

	search.engines = {
	  "Nix Packages" = {
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
		{ name = "channel"; value = "unstable"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };

	  "Nix Options" = {
	    urls = [{
	      template = "https://search.nixos.org/options";
	      params = [
		{ name = "channel"; value = "unstable"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@no" ];
	  };

	  "Home Manager Options" = {
	    urls = [{
	      template = "https://home-manager-options.extranix.com";
	      params = [
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@hm" ];
	  };

	  "Google Scholar" = {
	    urls = [{
	      template = "https://scholar.google.com/scholar";
	      params = [
		{ name = "h1"; value = "en"; }
		{ name = "q"; value = "{searchTerms}"; }
	      ];
	    }];
	    definedAliases = [ "@gs" ];
            iconMapObj."16" = "https://scholar.google.com/favicon.ico";
	  };

	  "youtube" = {
	    urls = [{
	      template = "https://www.youtube.com/results";
	      params = [
		{ name = "search_query"; value = "{searchTerms}"; }
	      ];
	    }];

	    definedAliases = [ "@yt" ];
            iconMapObj."16" = "https://www.youtube.com/favicon.ico";
	  };
	};

	  search.force = true;

	  /*
	bookmarks = [
	  {
	    name = "wikipedia";
	    tags = [ "wiki" ];
	    keyword = "wiki";
	    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
	  }
	];
*/
	settings = {
	  "dom.security.https_only_mode" = false;
	  "browser.download.panel.shown" = true;
	  "identity.fxaccounts.enabled" = false;
	  "signon.rememberSignons" = false;
	  "extensions.autoDisableScopes" = 0;
	  "browser.newtabpage.activity-stream.feeds.topsites" = false;
	  "browser.newtabpage.activity-stream.showWeather" = false;
	  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
	  "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
	  "browser.newtabpage.activity-stream.default.sites" = "";
	};

	/*
	extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
	  ublock-origin
	  sponsorblock
	  darkreader
	  #untrap-for-youtube
	  zotero-connector
	];
	*/
      };
    };
    stylix.targets.firefox.profileNames = [ "cmacwill" ];
  };
}
