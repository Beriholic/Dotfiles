{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cursor-theme = "Bibata-Modern-Classic";
  cursor-package = pkgs.bibata-cursors;
  moreWaita = pkgs.stdenv.mkDerivation {
    name = "MoreWaita";
    src = inputs.more-waita;
    installPhase = ''
      mkdir -p $out/share/icons
      mv * $out/share/icons
    '';
  };
in
{

  home = {
    packages = with pkgs; [
      # themes
      adwaita-qt6
      adw-gtk3
      material-symbols
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      google-fonts
      moreWaita
      bibata-cursors
      # morewaita-icon-theme
      # papirus-icon-theme
      # qogir-icon-theme
      # whitesur-icon-theme
      # colloid-icon-theme
      # qogir-theme
      # yaru-theme
      # whitesur-gtk-theme
      # orchis-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 24;
      gtk.enable = true;
    };
  };

  home.file.".local/share/icons/MoreWaita" = {
    source = "${moreWaita}/share/icons";
  };
}
