{ ... }:

{
    programs.kitty = {
        enable = true;

        settings = {
            enable_audio_bell = false;
            show_hyperlink_targets = "yes";
            copy_on_select = "clipboard";
            background_opacity = "0.8";

            background = "#251200";
            foreground = "#DDC265";
            
            cursor = "#DDC265";
            
            selection_foreground = "#DDC265";
            selection_background = "#E6A96B";
            
            color0 = "#000000";
            color8 = "#7F6A55";
            
            color1 = "#D6262B";
            color9 = "#E55A1C";
            
            color2 = "#919C00";
            color10 = "#BFC65A";
            
            color3 = "#BE8A13";
            color11 = "#FFCB1B";
            
            color4 = "#4699A3";
            color12 = "#7CC9CF";
            
            color5 = "#8D4331";
            color13 = "#D26349";
            
            color6 = "#DA8213";
            color14 = "#E6A96B";
            
            color7 = "#DDC265";
            color15 = "#FFEAA3";
        };
        
        font = {
            name = "CaskaydiaCove Nerd Font Mono";
        };
    };
}
