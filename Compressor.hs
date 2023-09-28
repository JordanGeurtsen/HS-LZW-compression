module Compressor where

import Data.Char (ord, chr)
import Dictionary as Dict
import System.Directory

compress :: String -> String
compress input =
  let dict = Dict.init
      current = ""
      inputStr = input
  in compressLoop dict current inputStr

compressLoop :: Dict.Directory -> String -> String -> String
compressLoop dict current input =
  case input of
    [] -> [chr (Dict.index dict current)]
    (x:xs) ->
      let currentString = current ++ [x]
      in if Dict.contains dict currentString
         then compressLoop dict currentString xs
         else [chr (Dict.index dict current)] ++ compressLoop (Dict.put dict currentString) [x] xs