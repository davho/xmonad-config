module Path where


import System.Directory (getHomeDirectory)
import XMonad


applicationsPath :: String
-- applicationsPath = "/usr/share/applications/"
applicationsPath = "/nix/var/nix/profiles/system/sw/share/applications"


home :: FilePath -> X FilePath
home path = io $ fmap (++ "/" ++ path) getHomeDirectory


projectPath :: X String
projectPath = io $ fmap (++ "/Projekte") getHomeDirectory
