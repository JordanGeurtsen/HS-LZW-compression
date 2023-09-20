import Data.Char (ord, chr)

-- The goal of this prototype is to check if i can return a list of times the letter A appears in a string
-- that is read from a file. Based on the results, i will build another prototype that wil focus on the cycle of pattern
-- matching and dictionary updating that will be the core of the compression algorithm.
getPatternMatch :: [(Int, String)] -> String -> [(Int, String)]
getPatternMatch dict contents = [(1, "a")]

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
    contents <- readFile input
    writeFile output $ show (getPatternMatch initDict contents)