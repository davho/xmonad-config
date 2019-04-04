module Applications where


import XMonad
import XMonad.Actions.SpawnOn (spawnHere)


import Path
import Terminal


data Application = Application { name :: String
                               , progs :: [X ()]
                               }


-- we'll see how stable chrome app-ids are…
chromiumAppCommand :: String -> String
chromiumAppCommand = ("chromium --app-id=" ++)


applications :: [Application]
applications =
  [ Application "Anki"          [spawnHere "anki -b $HOME/.Anki"]
  , Application "ARandR"        [spawnHere "arandr"]
  , Application "Audacity"      [spawnHere "audacity"]
  , Application "Chromium"      [spawnHere "chromium"]
  , Application "Chrome"        [spawnHere "google-chrome-stable"]
  , Application "Emacs"         [home "Bin/v" >>= spawnHere]
  , Application "Firefox"       [spawnHere "firefox"]
  , Application "Gimp"          [spawnHere "gimp"]
  , Application "GVim"          [spawnHere "gvim"]
  , Application "MediathekView" [spawnHere "mediathekview"]
  , Application "NetLogo"       [spawnHere "netlogo"]
  , Application "LibreOffice"   [spawnHere "libreoffice"]
  , Application "Signal"        [spawnHere "signal-desktop"]
  , Application "Spacemacs"     [spawnHere "emacsclient -c -a emacs"]
  , Application "Spotify"       [spawnHere "spotify"]
  , Application "Telegram"      [spawnHere "telegram-desktop"]
  , Application "Thunderbird"   [spawnHere "thunderbird"]
  , Application "Vim"           [spawnHere "gvim"]
  , Application "VirtualBox"    [spawnHere "VirtualBox"]
  , Application "VLC"           [spawnHere "vlc"]
  , Application "Windows"       [spawnHere "VirtualBox --startvm 'Windows 10'"]
  , Application "Zathura"       [spawnHere "zathura"]

  , Application "E-Mail"        [spawnHere "thunderbird"]
  , Application "Browser"       [spawnHere "firefox"]
  , Application "Editor"        [spawnHere "gvim"]
  , Application "Chat"
    [ spawnHere "signal-desktop"
    , spawnHere "telegram-desktop"
    , inTerminalWithName "RSS" "newsboat"
    , inTerminalWithName "E-Mail" "neomutt"
    ]
  ]


names :: [String]
names = map name applications


programs :: String -> [X ()]
programs name' =
  concatMap progs . filter (\app -> name app == name') $ applications
