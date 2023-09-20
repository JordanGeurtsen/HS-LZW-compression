import Data.Char (ord, chr)

makeASCIIList :: Int -> [(Int, String)]
makeASCIIList x
    | x < 0     = []
    | x > 255   = []
    | otherwise = (x, [chr x]) : makeASCIIList (x + 1)

initDir :: Int -> [(Int, String)]
initDir = makeASCIIList 0

main :: IO ()
main = do
   putStrLn "What file would you like to write to?"
   output <- getLine
   writeFile output $ show initDir
   putStrLn "Done!"