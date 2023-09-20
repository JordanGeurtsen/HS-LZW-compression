import Data.Char

stringToUTF8Array :: String -> [Int]
stringToUTF8Array [] = []
stringToUTF8Array (x:xs) = fromEnum x : stringToUTF8Array xs

main :: IO()
main = do
   putStrLn "What file would you like to encode?"
   input <- getLine
   contents <- readFile input

   putStrLn "What file would you like to write to?"
   output <- getLine
   writeFile output (unlines (map show (stringToUTF8Array contents)))
   putStrLn "Done!"