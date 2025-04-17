{
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
  home.packages =  with pkgs; [
    brightnessctl
    cliphist
    fuzzel
    grim
    hyprpicker
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock-effects
    swayidle
    slurp
    swww
    wayshot
    wlsunset
    wl-clipboard
    wf-recorder
    xwayland
    gvfs
    polkit_gnome
    easyeffects
    file-roller
    gnome-text-editor
    gnome-system-monitor
    gnome-control-center
    gnome-tweaks
    ddcutil
    nautilus
    wlogout
    hypridle
    d-spy
    dconf-editor
    hyprlock
    gnome-keyring
  ];

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
      env = LANG,zh_CN.UTF-8
      env = AGS_WEATHER_CITY, chongqing
      env = GDK_SCALE,1.5
      env = XCURSOR_SIZE, 32
      env = HYPRCURSOR_SIZE,32
      env = __GL_VRR_ALLOWED,1
      env = WLR_NO_HARDWARE_CURSORS,1
      env = WLR_DRM_NO_ATOMIC,1
      env = AGS_WEATHER_CITY, Chongqing
      env = QT_IM_MODULE, fcitx
      env = XMODIFIERS, @im=fcitx
      env = SDL_IM_MODULE, fcitx
      env = GLFW_IM_MODULE, ibus
      env = INPUT_METHOD, fcitx
      env = QT_QPA_PLATFORMTHEME, qt5ct
      env = GDK_BACKEND,wayland,x11
      env = QT_QPA_PLATFORM,wayland;xcb
      env = SDL_VIDEODRIVER，wayland
      env = CLUTTER_BACKEND，wayland
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      #env = NIXOS_OZONE_WL, 1
    '';

  };
}
