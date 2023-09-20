import Data.Char

main :: IO()
main = do
   putStrLn "What file would you like to encode?"
   input <- getLine
   contents <- readFile input

   putStrLn "What file would you like to write to?"
   output <- getLine
   writeFile output contents
   putStrLn "Done!"