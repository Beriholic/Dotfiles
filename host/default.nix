{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./graphics.nix
    ./fonts.nix
    ./locate.nix
    ./audio.nix
    ./virtualisation.nix
  ];
}
