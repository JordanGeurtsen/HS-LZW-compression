main = do
    putStrLn "What file would you like to write?"
    file <- getLine
    putStrLn "What would you like to write in it?"
    contents <- getLine
    writeFile file contents
    putStrLn "Done!"
