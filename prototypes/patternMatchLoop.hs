import Data.Char (ord, chr)

patternMatchLoop :: [(Int, String)] -> String -> [(Int, String)]
-- implement patternMatchLoop

makeASCIIList :: Int -> [(Int, String)]
makeASCIIList x
    | x < 0     = []
    | x > 255   = []
    | x `elem` [129, 141, 143, 144, 157] = makeASCIIList (x + 1)
    | otherwise = (x, [chr x]) : makeASCIIList (x + 1)

initDict :: [(Int, String)]
initDict = makeASCIIList 0

main :: IO ()
main = do
    putStrLn "What file would you like to read?"
    input <- getLine
    putStrLn "What file would you like to write to?"
    output <- getLine
    dictionary <- initDict
    contents <- readFile input
    writeFile output $ show $ patternMatchLoop dictionary contents