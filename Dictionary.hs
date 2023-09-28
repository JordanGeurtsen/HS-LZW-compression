module Dictionary where

import qualified Data.Map as Map
import System.Directory

type Directory = Map.Map String Int

getDictIndex :: Directory -> String -> Int
getDictIndex dict str = dict Map.! str

putInDict :: Directory -> String -> Directory
putInDict dict str = Map.insert str (Map.size dict) dict

dictContains :: Directory -> String -> Bool
dictContains dict str = Map.member str dict

initDict :: Directory
initDict = Map.fromList [(x:[], ord x) | x <- ['\0'..'\255']]