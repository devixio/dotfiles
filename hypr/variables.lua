
-- Environment Variables
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Qt Variables
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Toolkit backends
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("CLUTTER_BACKEND", "wayland")

-- Wayland / session
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_SCALE", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- XDG dirs
hl.env("XDG_RUNTIME_DIR", os.getenv("XDG_RUNTIME_DIR") or "/run/user/1000")
hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("XDG_CACHE_HOME", os.getenv("HOME") .. "/.cache")
hl.env("XDG_DATA_HOME", os.getenv("HOME") .. "/.local/share")
hl.env("XDG_STATE_HOME", os.getenv("HOME") .. "/.local/state")

-- Cursor
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

-- HyDE / misc
hl.env("GAMMA_WAYLAND", "1")
hl.env("TERMINAL", "alacritty")
hl.env("CATPPUCCIN_MOCHA", "1")
hl.env("HYPRLAND_NO_SD_NOTIFY", "1")
hl.env("HYPRLAND_NO_SD_VARS", "1")

-- Audio (fix Java/OpenAL on PipeWire)
hl.env("OPENAL_DRIVERS", "pulse")
hl.env("PULSE_SERVER", "unix:/run/user/1000/pulse/native")
hl.env("JAVA_TOOL_OPTIONS", "-Dsun.audio.device=pulse -Djava.awt.headless=false")
