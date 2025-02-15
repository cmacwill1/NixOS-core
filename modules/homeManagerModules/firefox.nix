{ lib, config, pkgs, inputs, ... }:

{
  options = {
    firefox.enable =
      lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.cmacwill = {

	search.engines = {
	  "Nix Packages" = {
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
		{ name = "type"; value = "packages"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];

	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };
	};
	search.force = true;

	bookmarks = [
	  {
	    name = "wikipedia";
	    tags = [ "wiki" ];
	    keyword = "wiki";
	    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
	  }
	];

	settings = {
	  "dom.security.https_only_mode" = true;
	  "browser.download.panel.shown" = true;
	  "identity.fxaccounts.enabled" = false;
	  "signon.rememberSignons" = false;
	  "extensions.autoDisableScopes" = 0;
	};

	extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
	  ublock-origin
	  sponsorblock
	  darkreader
	  #untrap-for-youtube
	  youtube-shorts-block
	  #youtube-recommended-videos
	  zotero-connector
	];
      };
    };
  };
}
