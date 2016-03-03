module StartUp where


import Control.Concurrent
import Control.Monad (when)
import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Util.Cursor
import XMonad.Util.SpawnOnce


import Programs
import ScreenSetup


-- startup
startupHook' :: String -> X ()
startupHook' host = case host of

    -- {{{ anaxagoras specific
    "anaxagoras" -> do

        -- spawnOnceSleep 10 "pidgin"
        spawnOnceSleep 10 "skype"
        -- TODO wrote "weechat" twice
        -- onceInTerminalWithNameSleep 10 "ircClient" "weechat"
        home "Bin/launchers/wa" >>= spawnOnceSleep 10

        defaultStartupHook
    -- }}}

    -- {{{ heraklit specific
    "heraklit" -> do

        -- screen configuration
        -- xfork $ screenSetup host

        defaultStartupHook
    -- }}}

    -- {{{ default
    _ -> defaultStartupHook

    where
        defaultStartupHook :: X ()
        defaultStartupHook = do

            -- don't know why i do this
            setWMName "LG3D"

            -- look and feel
            home "Bin/bg-set" >>= spawn
            setDefaultCursor xC_left_ptr
            spawnOnce "dunst -print >> ~/.dunst.log"
            spawnOnce "parcellite"
            spawnOnce "xcompmgr"
            spawnOnce "unclutter -idle 5 -root"
            spawnOnce "redshift -l 48.3:10.9 -t 5500:2800"
            spawnOnce "xset -b"
            spawnOnceSleep 2 "conky"

            -- start applications
            withTerminalWithName spawnOnce "twitter" "turses"
            withTerminalWithName spawnOnce "mail" "offlineimap"
            withTerminalWithName spawnOnce "mail" "mutt"
            browser
            onceInTerminalWithNameSleep 5 "htop" "htop -u david"
            spawnOnceSleep 10 "telegram"
    -- }}}


-- vim: foldmethod=marker:
