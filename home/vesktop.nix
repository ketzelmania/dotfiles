{ pkgs, ... }:

{
    home.file.".config/vesktop/settings/settings.json".source = ../dotfiles/vesktop/settings/settings.json;
    home.file.".config/vesktop/settings/quickCss.css".source = ../dotfiles/vesktop/settings/quickCss.css;
    home.file.".config/vesktop/themes".source = ../dotfiles/vesktop/themes;

    programs.vesktop = {
        enable = true;
    };
}
