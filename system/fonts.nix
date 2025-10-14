{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.caskaydia-cove

        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        fira-sans
        nasin-nanpa
        liberation_ttf
        mplus-outline-fonts.githubRelease
    ];
}
