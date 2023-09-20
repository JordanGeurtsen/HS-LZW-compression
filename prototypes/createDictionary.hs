import Data.Char (ord, chr)

initDir :: Int -> [(Int, String)]
initDir x
    | x < 0     = []
    | x > 255   = []
    | x `elem` [129, 141, 143, 144, 157] = initDir (x + 1)
    | otherwise = (x, [chr x]) : initDir (x + 1)

main :: IO ()
main = do
   putStrLn "What file would you like to write to?"
   output <- getLine
   writeFile output $ show (initDir 0)
   putStrLn "Done!"