module Utils where

import System.Directory

getCompressionInfo :: String -> String -> IO [Float]
getCompressionInfo inputFileName outputFileName = do
  inputFileSize <- getFileSize inputFileName
  outputFileSize <- getFileSize outputFileName
  let ratio = (fromIntegral inputFileSize) / (fromIntegral outputFileSize)
  let percentSaved = (ratio * 100) - 100
  return [fromIntegral inputFileSize, fromIntegral outputFileSize, ratio, percentSaved]