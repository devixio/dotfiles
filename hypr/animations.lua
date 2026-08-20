
-- Animations - Catppuccin Mocha
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("smooth",         { type = "bezier", points = { {0.4, 0},     {0.2, 1}     } })
hl.curve("catppuccin",     { type = "bezier", points = { {0.05, 0.7},  {0.1, 1.0}   } })

-- Springs
hl.curve("default",  { type = "spring", mass = 1, stiffness = 100, dampening = 15 })
hl.curve("vim",      { type = "spring", mass = 1, stiffness = 100, dampening = 15 })
hl.curve("wind",     { type = "spring", mass = 1, stiffness = 80,  dampening = 12 })
hl.curve("work",     { type = "spring", mass = 1, stiffness = 120, dampening = 15 })

-- Global animation
hl.animation({ leaf = "global",        enabled = true, speed = 10,  bezier = "default" })

-- Windows
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "default" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "default", style = "popin 95%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, spring = "default", style = "popin 95%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 4.79, spring = "default" })

-- Borders
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })

-- Fade
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "almostLinear" })

-- Layers
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "easeOutQuint", style = "fade" })

-- Fade Layers
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })

-- Workspaces
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.0,  bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 0.6,  bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.0,  bezier = "almostLinear", style = "slide" })

-- Zoom Factor
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })
