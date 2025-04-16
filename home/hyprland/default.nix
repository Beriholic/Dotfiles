{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  execs = import ./execs.nix { inherit pkgs; };
  general = import ./general.nix;
  keybinds = import ./keybinds.nix;
  rules = import ./rules.nix;
  layout = import ./layout/dwindle.nix;
in
{
  # imports = [
  #   ./env.nix
  # ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = lib.mkMerge [
      execs.settings
      general.settings
      keybinds.settings
      rules.settings
      layout.settings
      { source = [ "./colors.conf" ]; }
    ];
    extraConfig = ''
      #env = LANG,zh_CN.UTF-8
      env = AGS_WEATHER_CITY,chongqing
      env = GDK_SCALE,1.5
      env = XCURSOR_SIZE,24
      env = __GL_VRR_ALLOWED,1
      env = WLR_NO_HARDWARE_CURSORS,1
      env = WLR_DRM_NO_ATOMIC,1
      env = AGS_WEATHER_CITY, Chongqing
      # ######### Input method ########## 
      # See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
      env = QT_IM_MODULE, fcitx
      env = XMODIFIERS, @im=fcitx
      #env = GTK_IM_MODULE, wayland   # Crashes electron apps in xwayland
      #env = GTK_IM_MODULE, fcitx     # My Gtk apps no longer require this to work with fcitx5 hmm  
      env = SDL_IM_MODULE, fcitx
      env = GLFW_IM_MODULE, ibus
      env = INPUT_METHOD, fcitx

      # ############ Themes #############
      env = QT_QPA_PLATFORMTHEME, qt5ct
      # env = QT_STYLE_OVERRIDE,kvantum
      # env = WLR_NO_HARDWARE_CURSORS, 1

      # ######## Screen tearing #########
      # env = WLR_DRM_NO_ATOMIC, 1

      # ############ Others #############
      env = GDK_BACKEND,wayland,x11,*
      env = QT_QPA_PLATFORM,wayland;xcb
      env = SDL_VIDEODRIVER，wayland
      env = CLUTTER_BACKEND，wayland
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland

      # ############ Nvidia #############
      #env = LIBVA_DRIVER_NAME,nvidia
      #env = GBM_BACKEND，NVIDIA-DRM
      #env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    '';

  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };
}
