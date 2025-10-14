{ pkgs, lib, ... }:

{
    home.pointerCursor = let 
        getFrom = url: hash: name: size: {
            gtk.enable = true;
            x11.enable = true;
            name = name;
            size = size;
            package = 
                pkgs.runCommand "moveUp" {} ''
                    mkdir -p $out/share/icons
                    ln -s ${pkgs.fetchzip {
                        url = url;
                        hash = hash;
                    }}/cursors/Breeze/Breeze $out/share/icons/'${name}'
                    export XCURSOR_SIZE=${toString size}
            '';
        };
        in getFrom 
            "https://invent.kde.org/plasma/breeze/-/archive/54ffea94f71a06451e1eefd8bb741973a204a509/breeze-54ffea94f71a06451e1eefd8bb741973a204a509.tar.gz"
            "sha256-7Pr900WnHccl0Jh0cMM0Ek5qNzzq1PfjlBBEBMbh5ys="
            "Breeze"
            20;

    gtk = {
        enable = true;
        cursorTheme = {
            name = "Breeze";
        };
    };
}
