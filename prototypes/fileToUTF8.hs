-- SCRAPPED

import Data.Char
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Builder as BB

getByteString :: String -> B.ByteString
getByteString x = BL.toStrict (BB.toLazyByteString (BB.stringUtf8 x))

writeByteStringToFile :: FilePath -> B.ByteString -> IO()
writeByteStringToFile filePath byteString = do
    B.writeFile filePath byteString
    putStrLn (show byteString)


main :: IO()
main = do
   putStrLn "What file would you like to encode?"
   input <- Prelude.getLine
   contents <- Prelude.readFile input

   putStrLn "What file would you like to write to?"
   output <- Prelude.getLine
   writeByteStringToFile output (getByteString contents)
   putStrLn "Done!"