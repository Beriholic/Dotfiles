{
  settings = {
    bind = [
      "SUPER,1,workspace,1"
      "SUPER,2,workspace,2"
      "SUPER,3,workspace,3"
      "SUPER,4,workspace,4"
      "SUPER,5,workspace,5"
      "SUPER,6,workspace,6"
      "SUPER,7,workspace,7"
      "SUPER,8,workspace,8"
      "SUPER,9,workspace,9"
      "SUPER,0,workspace,10"
      "SUPER,F,fullscreen,1"
      "SUPERSHIFT,F,fullscreen,0"
      "SUPER,C,killactive,"
      "SUPER, T, togglefloating,"
      # Screenshot
      "SUPERSHIFT,S,exec,hyprshot -m region -o $HOME/Pictures/screenshot"
      "SUPER+CTRL,S,exec,hyprshot -m window -o $HOME/Pictures/screenshot"
      # Apps
      "ALT,space,exec,fuzzel"
      "SUPER,RETURN,exec,kitty"
      "SUPER,E,exec,nautilus"
      # Action
      "SUPER,Escape, exec, pkill wlogout || wlogout -p layer-shell"
      "Control+Super, T, exec, ~/.config/ags/scripts/color_generation/switchwall.sh"
      "Control+Super, B, exec, ags run-js 'openColorScheme.value = true Utils.timeout(2000, () => openColorScheme.value = false)'"
      "Control+Super, N, exec, ~/.config/ags/scripts/color_generation/dark_light_switch.sh"
      # bind = SUPER,m,exec, mpvpaper '*' -o "no-audio --loop" $HOME/Pictures/wallpapers/kosihiiii.mp4
      "SUPERSHIFT,m,exec, pkill -9 mpvpaper"
      "Ctrl+Alt, Slash, exec, ags run-js 'cycleMode()'"
    ];
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bindle = [
      #Volum
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioRaiseVolume, exec, ags run-js 'indicator.popup(1);'"
      ",XF86AudioLowerVolume, exec, ags run-js 'indicator.popup(1);'"
      ",XF86MonBrightnessUp, exec, ags run-js 'brightness.screen_value += 0.05; indicator.popup(1);'"
      ",XF86MonBrightnessDown, exec, ags run-js 'brightness.screen_value -= 0.05; indicator.popup(1);'"
    ];
    bindl = [
      "ALT,m, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ",XF86AudioMute, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
      ",XF86AudioMute, exec, ags run-js 'indicator.popup(1);'"
    ];
  };
}
