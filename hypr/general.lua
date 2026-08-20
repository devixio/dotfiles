
-- General Settings - Catppuccin Mocha
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 12,

        border_size = 4,

        col = {
            active_border   = { colors = { "rgba(89b4faee)", "rgba(cba6f7ee)" }, angle = 135 },
            inactive_border = "rgba(45475aee)",
        },

        resize_on_border    = true,
        extend_border_grab_area = 20,
        allow_tearing       = false,
        layout              = "dwindle",
    },
})

-- Dwindle layout
hl.config({
    dwindle = {
        preserve_split = true,
        smart_split    = false,
        smart_resizing = true,
    },
})

-- Master layout
hl.config({
    master = {
        new_status      = "master",
        new_on_top      = true,
        mfact           = 0.55,
        orientation     = "left",
        inherit_fullscreen = true,
    },
})

-- Scrolling layout
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Misc
hl.config({
    misc = {
        force_default_wallpaper    = 0,
        disable_hyprland_logo     = true,
        disable_splash_rendering  = true,
        mouse_move_enables_dpms   = true,
        key_press_enables_dpms    = true,
        cursor_warps              = false,
        new_window_takes_over_fullscreen = 2,
        enable_hyprcursor = true,
    },
})

-- Cursor
hl.config({
    cursor = {
        default_monitor = "",
        no_hardware_cursors = false,
    },
})

-- Environment variables
hl.config({
    env = {
        "QT_QPA_PLATFORMTHEME,qt6ct",
        "GTK_THEME,Catppuccin-Mocha",
        "XCURSOR_THEME,Bibata-Modern-Ice",
        "XCURSOR_SIZE,24",
    },
})

-- Debug
hl.config({
    debug = {
        error_limit = 0,
        suppress_errors = true,
    },
})
