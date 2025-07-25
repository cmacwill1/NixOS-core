{ ... }:

{
  programs.newsboat = {
    enable=true;
    extraConfig = ''
      prepopulate-query-feeds yes
      run-on-startup select-tag

      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key N prev-unread
      bind-key D pb-download
      bind-key U show-urls
      bind-key x pb-delete

      # View
      text-width 80

      color listnormal cyan default
      color listfocus black yellow standout bold
      color listnormal_unread blue default
      color listfocus_unread black yellow standout bold
      color info red black bold
      color article white default

      highlight article "^Feed:.*" color5 color0
      highlight article "^Title:.*" color3 color0 bold
      highlight article "^Author:.*" color2 color0
      highlight article "^Date:.*" white color0
      highlight article "^Link:.*" color4 color0
      highlight article "^Flags:.*" color9 color0
      highlight article "\\[[0-9][0-9]*\\]" color66 default bold
      highlight article "\\[image [0-9][0-9]*\\]" color109 default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" color66 default bold
    '';
  };
}
