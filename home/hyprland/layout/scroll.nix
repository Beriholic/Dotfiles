{
  settings = {
    general = {
      layout = "scroller";
    };

    bind = [
      "CTRLSUPER,j,movefocus,d"
      "CTRLSUPER,k,movefocus,u"
      "SUPER,h,movefocus,l"
      "SUPER,l,movefocus,r"
      "SUPERSHIFT,h,movewindow,l"
      "SUPERSHIFT,l,movewindow,r"
      "SUPERSHIFT,k,movewindow,u"
      "SUPERSHIFT,j,movewindow,d"
      "SUPER,U,scroller:alignwindow,l"
      "SUPER,I,scroller:alignwindow,c"
      "SUPER,O,scroller:alignwindow,r"
      "SUPER,P,scroller:fitsize,active"
      "SUPERSHIFT,P,scroller:fitsize,all"
      "ALT, TAB, scroller:toggleoverview"
      "ALTSHIFT,1,movetoworkspacesilent,1"
      "ALTSHIFT,2,movetoworkspacesilent,2"
      "ALTSHIFT,3,movetoworkspacesilent,3"
      "ALTSHIFT,4,movetoworkspacesilent,4"
      "ALTSHIFT,5,movetoworkspacesilent,5"
      "ALTSHIFT,6,movetoworkspacesilent,6"
      "ALTSHIFT,7,movetoworkspacesilent,7"
      "ALTSHIFT,8,movetoworkspacesilent,8"
      "ALTSHIFT,9,movetoworkspacesilent,9"
      "ALTSHIFT,0,movetoworkspacesilent,10"
      "ALT,Q,scroller:movefocus,u"
      "ALT,E,scroller:movefocus,d"
      "SUPER, equal, scroller:cyclesize, next"
      "SUPER, minus, scroller:cyclesize, prev"
      "SUPER, y, scroller:cyclesize, next"
      "SUPER,K,workspace,e-1"
      "SUPER,J,workspace,e+1"
    ];
  };
}
