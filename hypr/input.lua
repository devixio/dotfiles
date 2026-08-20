
-- Input Settings
-- Catppuccin Mocha Theme

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll   = true,
            tap-to-click     = true,
            drag_lock        = false,
            tap_button_map   = "lmr",
            clickfinger_behavior = false,
            middle_emulation = true,
            scroll_factor    = 1.0,
        },
    },
})

-- Gestures
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.gesture({
    fingers   = 4,
    direction = "vertical",
    action    = "global",
})
