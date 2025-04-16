{ inputs, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home = {
    packages = with pkgs; [
      brightnessctl
      gtksourceview
      ddcutil
      gradience
      hyprpicker
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      pywal
      webkitgtk_6_0
      swayidle
      webp-pixbuf-loader
      ydotool
      bc
      ddcutil
      blueberry
      dart-sass
      gnome-usage
      slurp
      gojq
      glib
      gnome-bluetooth
      gammastep
      gnome-control-center
      (python3.withPackages (
        p: with p; [
          pillow
          libsass
          setproctitle
          materialyoucolor
          material-color-utilities
          psutil
          pywayland
        ]
      ))
    ];
  };

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./../.config/ags;
    extraPackages = with pkgs; [
      brightnessctl
      gtksourceview
      ddcutil
      gradience
      hyprpicker
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      pywal
      webkitgtk_6_0
      swayidle
      webp-pixbuf-loader
      ydotool
      bc
      ddcutil
      blueberry
      dart-sass
      gnome-usage
      slurp
      gojq
      glib
      gnome-bluetooth
      gammastep
      gnome-control-center
      (python3.withPackages (
        p: with p; [
          pillow
          libsass
          setproctitle
          materialyoucolor
          material-color-utilities
          psutil
          pywayland
        ]
      ))
    ];
  };
}
