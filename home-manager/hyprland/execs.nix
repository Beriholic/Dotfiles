{ pkgs, ... }:
{
  settings = {
    "exec-once" = [
      "swww-daemon --format xrgb --no-cache"
      "qs &"
      "fcitx5"
      "gnome-keyring-daemon --start --components=secrets"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      # "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      "dbus-update-activation-environment --all"
      "sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      # "hyprpm reload -nn"
      #"exec-once = mpvpaper '*' -o 'no-audio --loop' $HOME/Videos/12.mp4"
      "hypridle"
      #exec-once=blueman-applet
      #exec-once=~/.config/hypr/scripts/screensharing.sh
      "hyprctl setcursor Bibata-Modern-Classic 32"
      "easyeffects --gapplication-service"
      #exec-once=udiskie &
      #exec-once=systemctl --user start xsettingsd.servic
      "xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1"
      "echo 'Xft.dpi:144' | xrdb -merge"
      #exec-once=sh $HOME/.config/hypr/script/adjust-kitty-opactiy.sh
      ''
        sleep1;swww img "$(cat ~/.local/state/wallpaper.txt)";sleep 1;swww img "$(cat ~/.local/state/wallpaper.txt)"
      ''
    ];
  };
}
