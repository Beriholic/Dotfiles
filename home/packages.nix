{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # app
    blueberry
    firefox
    kitty
    icon-library
    yad
    vscode
    qq

    # tools
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    bat
    fd
    eza
    ripgrep
    fzf
    jq
    gojq
    acpi
    ffmpeg
    libnotify
    zip
    unzip
    glib
    starship
    btop
    pciutils
    usbutils
    btop
    gradience
    mihomo-party
    ranger
    duf
    xdg-user-dirs
    xorg.xrdb
    xorg.xprop
    lazygit

    # hyprland
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
    xdg-desktop-portal-hyprland
    hypridle
    d-spy
    dconf-editor

    # dev
    nodejs
    gjs
    bun
    cargo
    go
    gcc
    typescript
    eslint

    # ide
    android-studio
  ];

  services = {
    udiskie.enable = true;
  };
}
