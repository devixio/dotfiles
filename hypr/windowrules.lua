
-- Window Rules - Catppuccin Mocha
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Suppress maximize events
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Float rules
hl.window_rule({
    name  = "float-rules",
    match = {
        class = {
            "pavucontrol",
            "nm-connection-editor",
            "blueman-manager",
            "org.gnome.Calculator",
            "org.gnome.Nautilus",
            "file-roller",
            "feh",
            "mpv",
            "imv",
            "viewnior",
            "Sxiv",
            "Arandr",
            "Galculator",
            "octave-gui",
            "nitrogen",
            "xfce-polkit",
        },
    },
    float = true,
    size  = "800 600",
})

-- Dialog rules
hl.window_rule({
    name  = "dialog-rules",
    match = {
        windowtype = "dialog",
    },
    float = true,
    center = true,
})

-- Popup rules
hl.window_rule({
    name  = "popup-rules",
    match = {
        windowtype = "popup",
    },
    float = true,
})

-- File picker rules
hl.window_rule({
    name  = "file-picker-rules",
    match = {
        title = "Open File",
    },
    float = true,
    size  = "900 700",
    center = true,
})

-- Alacritty rules
hl.window_rule({
    name  = "alacritty-rules",
    match = {
        class = "Alacritty",
    },
    opacity       = 0.85,
    blur           = false,
    shadow         = true,
})

-- Alacritty - blur + transparency (extra)
hl.window_rule({
    name  = "alacritty-extra-rules",
    match = {
        class = "Alacritty",
    },
    dim            = true,
    dim_inactive   = true,
    dim_strength   = 0.1,
})

-- Dolphin rules
hl.window_rule({
    name  = "dolphin-rules",
    match = { class = "org.kde.dolphin" },
    opacity = 0.95,
    blur    = true,
    shadow  = true,
})

-- Librewolf rules
hl.window_rule({
    name  = "librewolf-rules",
    match = {
        class = "librewolf",
    },
    opacity = 0.98,
})

-- Discord rules
hl.window_rule({
    name  = "discord-rules",
    match = {
        class = "discord",
    },
    workspace = "name:chat",
    opacity   = 0.93,
    blur       = true,
})

-- Spotify rules
hl.window_rule({
    name  = "spotify-rules",
    match = {
        class = "Spotify",
    },
    workspace = "name:media",
})

-- Gimp rules
hl.window_rule({
    name  = "gimp-rules",
    match = {
        class = "[Gg]imp",
    },
    float = true,
    size  = "1000 700",
})

-- Inkscape rules
hl.window_rule({
    name  = "inkscape-rules",
    match = {
        class = "inkscape",
    },
    float = true,
    size  = "1000 700",
})

-- Steam rules
hl.window_rule({
    name  = "steam-rules",
    match = {
        class = "steam",
    },
    float = true,
    size  = "900 700",
    center = true,
})

-- Wine / Proton fullscreen games
hl.window_rule({
    name  = "wine-fullscreen",
    match = {
        class = "Wine|wine|\.exe|gamescope",
    },
    fullscreen    = true,
    border_size   = 0,
    rounding      = 0,
    gaps_in       = 0,
    gaps_out      = 0,
    blur           = false,
    shadow         = false,
    dim            = false,
    animationstyle = "popin",
})

-- Layer rules
hl.layer_rule({
    name  = "wofi-fancy",
    match = { namespace = "^wofi$" },
    animation = "popin 90%",
    blur = true,
    dim_around = true,
})

-- Workspace Rules
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
