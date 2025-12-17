{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.caskaydia-cove

        freetype
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        noto-fonts-lgc-plus
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-emoji-blob-bin
        noto-fonts-monochrome-emoji
        hanazono
        fira-sans
        nasin-nanpa
        liberation_ttf
        mplus-outline-fonts.githubRelease
        dejavu_fonts
        twemoji-color-font
        corefonts
        vista-fonts
    ];
}
