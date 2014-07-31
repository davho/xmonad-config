module Dzen where


import XMonad.Hooks.DynamicLog
-- import XMonad.Util.Loggers
import XMonad.Util.Run
-- import XMonad.Util.WorkspaceCompare


dzenCommand :: String
dzenCommand = "killall dzen2; dzen2 -p -xs 2 -ta r -tw 1680 -fn Inconsolata-14:normal -fg '#ffffff' -bg '#000000' -e 'onStart=lower'"


dzenPP' handle = defaultPP
    { ppOutput          = hPutStrLn handle
    -- , ppCurrent         = surroundWith "[ " " ]" . return . head
    -- , ppVisible         = surroundWith "[ " " ] " . return . head
    , ppCurrent         = dzenColor "#729fcf" "" -- tango blue
    , ppVisible         = dzenColor "white" ""
    , ppHidden          = dzenColor "#555753" "" -- tango lightblack
    , ppHiddenNoWindows = const ""
    , ppUrgent          = dzenColor "#ef2929" "" -- tango lightred
    , ppSep             = "  |  "
    , ppWsSep           = "  "
    , ppTitle           = shorten 50
    -- , ppLayout          = dzenColor "white" "" . icon
    , ppLayout          = dzenColor "white" ""
    , ppOrder           = reverse
    -- , ppSort            = mkWsSort getXineramaPhysicalWsCompare
    -- , ppExtras          =  [maildirNew "~/Mail/gmail/INBOX"] -- [date "%Y-%m-%d"]
    }

    where
    icon layout = case layout of
        "Tall" -> "^i(~/.xmonad/icons/layout_tall.xbm)"
        "Mirror Tall" -> "^i(~/.xmonad/icons/layout_mirror_tall.xbm)"
        "Full" -> "^i(~/.xmonad/icons/layout_full.xbm)"
        "Grid" -> "^i(~/.xmonad/icons/grid.xbm)"
        "Circle" -> "^i(~/.xmonad/icons/empty.xbm)"
        other -> other
