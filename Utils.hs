module Utils where

import System.Directory

getCompressionRatio :: String -> String -> IO Float
getCompressionRatio inputFileName outputFileName = do
  inputFileSize <- getFileSize inputFileName
  outputFileSize <- getFileSize outputFileName
  let ratio = (fromIntegral outputFileSize) / (fromIntegral inputFileSize) * 100
  return ratio