import ProjectSpecific
import Replace
import System.IO
import System.Environment

import LibHaskell.LibLists

main = do
	(b:c:_) <- getArgs
	code <- openFile b ReadMode
	homeDir <- getEnv "HOME"
	langdefinesConfig <- openFile  (homeDir ++ "/" ++ ".preprocess/config") ReadMode
	langDefinesLocation <- hGetContents langdefinesConfig
	langDefinesFile <- openFile (grab (lines langDefinesLocation)) ReadMode
	langDefinesText <- hGetContents langDefinesFile
	codeText <- hGetContents code
	let translatedFile = (replList (lines codeText) (makeAllParameters (sanitize (lines langDefinesText)))) in writeFile c $ unwords $ map ((flip appendList) "\n") translatedFile 