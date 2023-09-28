import GHC.IO.Encoding
import System.Directory
import Data.Char (ord, chr)
import qualified Data.Map as Map

type Directory = Map.Map String Int

encodeLoop :: Map.Map String Int -> String -> String -> String
encodeLoop dict current inputStr =
  case inputStr
  of [] -> [chr (dict Map.! current)]
      (x:xs) ->
        let currentString = current ++ [x]
        in if dictContains dict currentString
           then encodeLoop dict currentString xs
           else [chr (getDictIndex dict current)] ++ encodeLoop (putInDict dict currentString) [x] xs

encode :: String -> String
encode input = encodeLoop initDict "" input

dictContains :: Directory -> String -> Bool
dictContains dict str = Map.member str dict

getDictIndex :: Directory -> String -> Int
getDictIndex dict str = dict Map.! str

putInDict :: Directory -> String -> Directory
putInDict dict str = Map.insert str (Map.size dict) dict

initDict :: Directory
initDict = Map.fromList [(x:[], ord x) | x <- ['\0'..'\255']]

main :: IO ()
main = do
    setLocaleEncoding utf8

    putStrLn "Starting process..."
    writeFile "input.txt" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quam leo, efficitur eu odio sed, dictum mollis velit. Nulla efficitur dui a nisl rhoncus, quis cursus elit imperdiet. Nullam sollicitudin lectus nec iaculis dictum. Vestibulum mollis risus vel elit mattis, in efficitur neque aliquam. Donec facilisis accumsan tortor. Vestibulum nibh ante, convallis vitae lorem ut, suscipit aliquam arcu. Nullam eget metus at tellus laoreet scelerisque ac eu felis. "
    contents <- readFile "input.txt"
    writeFile "output.txt" (Main.encode contents)
    putStrLn "Done!"