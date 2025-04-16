{
  settings = {
    windowrule = [
      # Float Necessary Windows
      "float,Rofi"
      "float,fuzzel"
      "float,nmtui"
      "float,pavucontrol"
      # Increase the opacity
      "opacity 0.8,kitty"
      "opacity 0.8,foot"
      "opacity 0.92,Thunar"
      "opacity 0.96,discord"
      "opacity 0.9,VSCodium"
      "opacity 0.88,obsidian"
      "opacity 0.5,dunst"
      "opacity 0.5,mako"
      "noblur,^(wemeetapp)$"
      #^.*nvim.*$
      "tile,librewolf"
      "tile,spotify"
      "opacity 0.5,neovim"
      "opacity 0.5,nvim"
      # Dialogs
      "float,title:^(Open File)(.*)$"
      "float,title:^(Select a File)(.*)$"
      "float,title:^(Choose wallpaper)(.*)$"
      "float,title:^(Open Folder)(.*)$"
      "float,title:^(Save As)(.*)$"
      "float,title:^(Library)(.*)$"
      "pseudo, fcitx"
    ];
    layerrule = [
      "animation slide left, sideleft.*"
      "animation slide right, sideright.*"
      "blur, bar[0-9]*"
      "blur, cheatsheet[0-9]*"
      "blur, barcorner.*"
      "blur, dock[0-9]*"
      "blur, gtk-layer-shell"
      "blur, indicator.*"
      "blur, indicator.*"
      "blur, launcher"
      "blur, notifications"
      "blur, osk[0-9]*"
      "blur, overview[0-9]*"
      "blur, session"
      "blur, shell:*"
      "blur, sideleft[0-9]*"
      "blur, sideright[0-9]*"
      "ignorealpha 0.5, launcher"
      "ignorealpha 0.69, notifications"
      "ignorealpha 0.6, bar[0-9]*"
      "ignorealpha 0.6, barcorner.*"
      "ignorealpha 0.6, cheatsheet[0-9]*"
      "ignorealpha 0.6, dock[0-9]*"
      "ignorealpha 0.6, indicator.*"
      "ignorealpha 0.6, indicator.*"
      "ignorealpha 0.6, osk[0-9]*"
      "ignorealpha 0.6, overview[0-9]*"
      "ignorealpha 0.6, shell:*"
      "ignorealpha 0.6, sideleft[0-9]*"
      "ignorealpha 0.6, sideright[0-9]*"
      "ignorezero, gtk-layer-shell"
      "noanim, anyrun"
      "noanim, hyprpicker"
      "noanim, indicator.*"
      "noanim, noanim"
      "noanim, osk"
      "noanim, overview"
      "noanim, selection"
      "noanim, walker"
      "xray 1, .*"
    ];
  };
}

#windowrulev2=windowdance,class:^(jetbrains-.*)$
# search dialog
#windowrulev2=dimaround,class:^(jetbrains-.*)$,floating:1,title:^(?!win)
#windowrulev2=center,class:^(jetbrains-.*)$,floating:1,title:^(?!win)
# autocomplete & menus
#windowrulev2=noanim,class:^(jetbrains-.*)$,title:^(win.*)$
#windowrulev2=noinitialfocus,class:^(jetbrains-.*)$,title:^(win.*)$
#windowrulev2=rounding 0,class:^(jetbrains-.*)$,title:^(win.*)$
