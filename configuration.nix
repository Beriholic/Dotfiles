{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./host
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "jiny";
  networking.networkmanager.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    curl
    wget
    fastfetch
    nixfmt-rfc-style
    upower
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
