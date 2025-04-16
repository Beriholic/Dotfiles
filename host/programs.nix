{ pkgs, ... }:
{
  programs = {
    fish.enable = true;
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
  };
}
