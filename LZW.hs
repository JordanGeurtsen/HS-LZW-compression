module LZW where

import GHC.IO.Encoding
import Compressor as C
import Utils as U

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
                compressionInfo <- U.getCompressionInfo fileName outputName
                putStrLn ("Original size is " ++ (show (compressionInfo !! 0)) ++
                          "B. Compressed size is " ++ (show (compressionInfo !! 1)) ++
                          "B. The compression ratio is " ++ (show (compressionInfo !! 2)) ++
                          ". That is " ++ (show (compressionInfo !! 3)) ++
                          "% space saved.")
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