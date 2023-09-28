module Dictionary where

import qualified Data.Map as Map
import Data.Char (ord)
import System.Directory

type Directory = Map.Map String Int

index :: Directory -> String -> Int
index dict str = dict Map.! str

put :: Directory -> String -> Directory
put dict str = Map.insert str (Map.size dict) dict

contains :: Directory -> String -> Bool
contains dict str = Map.member str dict

init :: Directory
init = Map.fromList [(x:[], ord x) | x <- ['\0'..'\255']]