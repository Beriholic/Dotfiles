{ pkgs, ... }:
{
  users = {
    users.beri = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
}
