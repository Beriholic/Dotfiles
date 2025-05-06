{
  pkgs,
  ...
}:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      fira-code-nerdfont
      nerdfonts
      # nerd-fonts.agave
      # nerd-fonts._0xproto
      material-symbols
      google-fonts
      jetbrains-mono
      google-fonts
      cascadia-code
      material-symbols
      corefonts
      vistafonts
    ];
    fontconfig = {
      antialias = true;
      hinting.enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "FiraCode Nerd Font" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
      };
    };
  };
}
