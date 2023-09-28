module Utils where

import System.Directory

getCompressionInfo :: String -> String -> IO [Float]
getCompressionInfo inputFileName outputFileName = do
  inputFileSize <- getFileSize inputFileName
  outputFileSize <- getFileSize outputFileName
  let ratio = (fromIntegral outputFileSize) / (fromIntegral inputFileSize)
  let percentSaved = 100 - (ratio * 100)
  return [fromIntegral inputFileSize, fromIntegral outputFileSize, ratio, percentSaved]