 -- Imports.
import XMonad
import XMonad.Hooks.DynamicLog

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
  { modMask = mod4Mask
  , terminal = myTerminal
  , borderWidth = myBorderWidth
  }

myTerminal    = "xfce4-terminal"
myModMask     = mod4Mask
myBorderWidth = 3


-- Startup Hook {{{
myStartupHook = do
  spawnOnce "feh --bg-fill ~/.xmonad/background2.png"
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "compton --config /dev/null -bGC"
  spawnOnce "xclip"
  spawnOnce "fcitx -d"
-- }}}

