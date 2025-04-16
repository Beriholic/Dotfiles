{ hyprland, pkgs, ... }:
{
  imports = [
    hyprland.homeManagerModules.default
    ./ags.nix
    ./mimelist.nix
    ./packages.nix
    ./starship.nix
    ./theme.nix
    ./hyprland
    ./dconf.nix
  ];

  home = {
    username = "beri";
    homeDirectory = "/home/beri";
    packages = [ pkgs.dconf ];
  };

  xdg.userDirs = {
    createDirectories = true;
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName  = "Beriholic";
    userEmail = "beriholic@petalmail.com";
  };
  home.stateVersion = "24.11";
}
