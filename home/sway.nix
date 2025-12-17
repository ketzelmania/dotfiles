{ pkgs, lib, ... }: 

let
    mod = "Mod4";
in
{
    programs.wofi = {
        enable = true;
    };

    home.file.".config/sway/wp".source = ../dotfiles/wallpaper/wp11541583-call-of-cthulhu-wallpapers.jpg;
    home.file.".config/sway/wl-color-picker.sh".source = ../dotfiles/scripts/wl-color-picker.sh;
    xdg.configFile."waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;
    xdg.configFile."waybar/style.css".source = ../dotfiles/waybar/style.css;

    services.swaync = {
        enable = true;
    };

    wayland.windowManager.sway = {
        enable = true;
        package = pkgs.swayfx;
        checkConfig = false;

        wrapperFeatures.gtk = true;

        xwayland = true;
        systemd.enable = true;

        extraConfig = ''
            for_window [title=".*Bitwarden.*"] floating enable
            for_window [title="imv"] floating enable

            gaps inner 20

            default_border none

            blur enable
            blur_noise 0.1
            corner_radius 16
            shadows enable
            default_dim_inactive 0.1

            seat seat0 xcursor_theme Breeze 20

            exec swaylock -i /home/met/.config/sway/wp --clock --indicator --effect-blur 7x5 --effect-vignette 0.5:0.5 --indicator-thickness 6 --text-color FFFFFF
        '';

        config = rec {
            modifier = "Mod4";
            terminal = "kitty";
            menu = "wofi --show drun";

            startup = [
                { command = "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"; }
                { command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP=sway"; }
            ];

            bars = [
                { command = "waybar"; }
            ];

            input = {
                "type:touchpad" = {
                    accel_profile = "adaptive";
                    click_method = "button_areas";
                    dwt = "disabled";
                    natural_scroll = "enabled";
                    scroll_method = "two_finger";
                    tap = "enabled";
                };
                
                "type:keyboard" = {
                    xkb_layout = "us_qwerty-prog";
                    xkb_options = "ctrl:nocaps";
                };
            };

            output = {
                "*" = {
                    bg = "wp fill";
                };
            };

            keybindings = lib.mkOptionDefault {
                "${mod}+plus" = "workspace number 1";
                "${mod}+bracketleft" = "workspace number 2";
                "${mod}+braceleft" = "workspace number 3";
                "${mod}+parenleft" = "workspace number 4";
                "${mod}+ampersand" = "workspace number 5";
                "${mod}+equal" = "workspace number 6";
                "${mod}+parenright" = "workspace number 7";
                "${mod}+braceright" = "workspace number 8";
                "${mod}+bracketright" = "workspace number 9";
                "${mod}+asterisk" = "workspace number 10";

                "${mod}+Shift+plus" = "move container to workspace number 1";
                "${mod}+Shift+bracketleft" = "move container to workspace number 2";
                "${mod}+Shift+braceleft" = "move container to workspace number 3";
                "${mod}+Shift+parenleft" = "move container to workspace number 4";
                "${mod}+Shift+ampersand" = "move container to workspace number 5";
                "${mod}+Shift+equal" = "move container to workspace number 6";
                "${mod}+Shift+parenright" = "move container to workspace number 7";
                "${mod}+Shift+braceright" = "move container to workspace number 8";
                "${mod}+Shift+bracketright" = "move container to workspace number 9";
                "${mod}+Shift+asterisk" = "move container to workspace number 10";

                "Shift+f4" = "exec grim -g \"$(slurp -d)\" - | wl-copy";
                "${mod}+z" = "exec wofi -modi window -show window";

                "${mod}+Shift+n" = "exec swaync-client -t -sw";
                "${mod}+period" = "exec grim -g \"$(slurp -b 00000000 -p)\" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4 | wl-copy";

                "${mod}+e" = "exec swaylock -i /home/met/.config/sway/wp --clock --indicator --effect-blur 7x5 --effect-vignette 0.5:0.5 --indicator-thickness 6 --text-color FFFFFF";

                "XF86AudioMute" = "exec pactl set-sink-mute \\@DEFAULT_SINK@ toggle";
                "XF86AudioLowerVolume" = "exec pactl set-sink-volume \\@DEFAULT_SINK@ -5%";
                "XF86AudioRaiseVolume" = "exec pactl set-sink-volume \\@DEFAULT_SINK@ +5%";
                "XF86AudioMicMute" = "exec pactl set-source-mute \\@DEFAULT_SOURCE@ toggle";
                "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
                "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
            };
        };
    };
}
