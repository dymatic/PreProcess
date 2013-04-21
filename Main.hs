import ProjectSpecific
import Replace
import System.IO
import System.Environment
import LibHaskell.LibLists
main = do
	(b:c:_) <- getArgs
	code <- openFile b ReadMode
	langdefines <- openFile "/etc/preprocess/langdefines" ReadMode
	langDefinesText <- hGetContents langdefines
	codeText <- hGetContents code
	let translatedFile = (replList (lines codeText) (makeAllParameters (sanitize (lines langDefinesText)))) in writeFile c $ unwords $ map ((flip appendList) "\n") translatedFile 