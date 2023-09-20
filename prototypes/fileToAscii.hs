import Data.Char

stringToAsciiArray :: String -> [Int]
stringToAsciiArray [] = []
stringToAsciiArray (x:xs) = fromEnum x : stringToAsciiArray xs

main :: IO()
main = do
   putStrLn "What file would you like to encode?"
   input <- getLine
   contents <- readFile input

   putStrLn "What file would you like to write to?"
   output <- getLine
   writeFile output (unlines (map show (stringToAsciiArray contents)))
   putStrLn "Done!"