main = do
    putStrLn "What file would you like to read?"
    file <- getLine
    contents <- readFile file
    putStrLn contents