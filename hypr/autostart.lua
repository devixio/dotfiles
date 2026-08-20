
-- Autostart
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    -- D-Bus & systemd environment sharing
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_CONFIG_HOME")

    -- XDG portal reset
    hl.exec_cmd("hyde-shell resetxdgportal.sh")

    -- Icon theme (match KDE: Catppuccin-Mocha-Alt)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Catppuccin-Mocha-Alt'")
    hl.exec_cmd("kwriteconfig6 --file kdeglobals --group Icons --key Theme Catppuccin-Mocha-Alt")

    -- Polkit agent
    hl.exec_cmd("hyde-shell app -t service -- polkitkdeauth.sh")

    -- Clipboard managers
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Notification daemon
    hl.exec_cmd("dunst")

    -- Bar
    hl.exec_cmd("waybar")

    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    -- Wallpaper
    hl.exec_cmd("awww img /home/devix/Pictures/wallpapers/hollow-knight-mystical-forest-4k-wallpaper.jpg")

    -- Battery notification
    hl.exec_cmd("batterynotify.sh")

    -- System tray applets
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("udiskie --no-automount --smart-tray")
    hl.exec_cmd("blueman-applet")

    -- Idle daemon & blue light filter
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
