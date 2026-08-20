
-- Decoration Settings - Catppuccin Mocha
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    decoration = {
        rounding       = 0,
        rounding_power = 2,

        active_opacity   = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 3,
            color        = "rgba(11111b55)",
            offset       = "0 4",
            scale        = 1,
        },

        blur = {
            enabled    = true,
            size       = 8,
            passes     = 4,
            noise      = 0.02,
            contrast   = 1.0,
            brightness = 0.85,
            vibrancy   = 0.2,
            vibrancy_darkness = 0.5,
            special    = true,
            new_optimizations = true,
            xray       = false,
            popups     = true,
        },
    },
})

-- Window decoration colors via decoration.col
-- Active: Mocha Blue -> Mocha Mauve gradient
-- Inactive: Mocha Surface0
