{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./host
  ];

  boot.loader = {
    timeout= -1;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      theme = pkgs.fetchFromGitHub {
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
        sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
      };
      # minegrub-world-sel = {
      #   enable = true;
      #   customIcons = [
      #     {
      #       name = "nixos";
      #       lineTop = "NixOS (23/11/2023, 23:03)";
      #       lineBottom = "Survival Mode, No Cheats, Version: 23.11";
      #       # Icon: you can use an icon from the remote repo, or load from a local file
      #       imgName = "nixos";
      #       # customImg = builtins.path {
      #       #   path = ./nixos-logo.png;
      #       #   name = "nixos-img";
      #       # };
      #     }
      #   ];
      # };
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.hostName = "jiny";
  networking.networkmanager.enable = true;
  security.polkit.enable = true;
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    curl
    wget
    fastfetch
    nixfmt-rfc-style
    upower
    firefox
    kitty
  ];

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [
          "gtk"
          "hyprland"
        ];
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "beri";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
