module LZW where

import GHC.IO.Encoding
import Compressor as C

main :: IO ()
main = do
  setLocaleEncoding utf8

  putStrLn "Would you like to compress or decompress a file? (c/d)"
  choice <- getLine
  case choice
    of "c" -> do
                putStrLn "Enter the name of the file you would like to compress:"
                fileName <- getLine
                contents <- readFile fileName
                putStrLn "Enter the name of the file you would like to write the compressed data to:"
                outputName <- getLine
                writeFile outputName (C.compress contents)
                putStrLn "Done!"
       "d" -> do
                putStrLn "Decompression is not yet implemented."
--                putStrLn "Enter the name of the file you would like to decompress:"
--                fileName <- getLine
--                contents <- readFile fileName
--                putStrLn "Enter the name of the file you would like to write the decompressed data to:"
--                outputName <- getLine
--                writeFile outputName (C.decompress contents)
--                putStrLn "Done!"
       _ -> putStrLn "Invalid choice."