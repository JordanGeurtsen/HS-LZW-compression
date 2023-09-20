import Data.Char (ord, chr)
import Data.List (group, sort)

-- The goal of this prototype is to check if i can return a list of times the letter A appears in a string
-- that is read from a file. Based on the results, i will build another prototype that wil focus on the cycle of pattern
-- matching and dictionary updating that will be the core of the compression algorithm.
getPatternMatch :: [(Int, String)] -> String -> Int
getPatternMatch dict contents = length $ filter (== "A") $ words contents

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
    putStrLn "Starting process..."
    writeFile "input.txt" "B A B B A B B A B"
    contents <- readFile "input.txt"
    putStrLn (show (getPatternMatch initDict contents) ++ " times")