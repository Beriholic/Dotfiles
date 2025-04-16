{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      LANG = "zh_CN.UTF-8";
      AGS_WEATHER_CITY = "chongqing";
      GDK_SCALE = 1.5;
      #XCURSOR_SIZE=24;
      __GL_VRR_ALLOWED = 1;
      WLR_NO_HARDWARE_CURSORS = 1;
      WLR_DRM_NO_ATOMIC = 1;
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
      INPUT_METHOD = "fcitx";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      GDK_BACKEND = "wayland=x11=*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      #LIBVA_DRIVER_NAME=nvidia
      #GBM_BACKEND，NVIDIA-DRM
      #__GLX_VENDOR_LIBRARY_NAME=nvidia
    };
  };
}
