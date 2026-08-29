-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Note: most of what used to be custom here (browser, file manager, Signal,
-- Obsidian, 1Password, ChatGPT, Calendar, Email, YouTube, WhatsApp, Google
-- Messages, X) now ships as Omarchy default preinstalled-app bindings, so
-- only the genuinely custom bindings remain below.

-- Resize the focused window while held.
o.bind("SUPER + SHIFT + ALT + H", "Resize left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + SHIFT + ALT + J", "Resize down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
o.bind("SUPER + SHIFT + ALT + K", "Resize up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
o.bind("SUPER + SHIFT + ALT + L", "Resize right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
