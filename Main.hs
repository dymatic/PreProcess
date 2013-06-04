import ProjectSpecific
import System.IO
import System.Environment

import Archimedes.Sequence.Manipulate
import Archimedes.Sequence.Clarify
import Archimedes.Tasking.Replace

appendList :: [a] -> a -> [a]
appendList [] _ = []
appendList x b = x ++ b:[] 

replaceAll :: String -> [(String,String)] -> String
replaceAll c [] = c
replaceAll str ((a,b):xs) = replaceAll (replaceList str (a,b)) xs

replaceEverything :: [String] -> [(String,String)] -> [String]
replaceEverything [] _ = []
replaceEverything (x:xs) y = replaceAll x y : replaceEverything xs y

main = do
        (b:c:_) <- getArgs
	code <- openFile b ReadMode
	homeDir <- getEnv "HOME"
	langdefinesConfig <- openFile (homeDir ++ "/" ++ ".preprocess/config") ReadMode
	langDefinesLocation <- hGetContents langdefinesConfig
	langDefinesFile <- openFile (head (lines langDefinesLocation)) ReadMode
	langDefinesText <- hGetContents langDefinesFile
	codeText <- hGetContents code

	let allParams = makeAllParameters (sanitize (lines langDefinesText))
        putStrLn "Santize:"
        mapM putStrLn (sanitize (lines langDefinesText))
        putStrLn "-"
        mapM putStrLn (map snd allParams)
        let translatedFile = replaceEverything (lines codeText) allParams in writeFile c (unwords translatedFile) 
