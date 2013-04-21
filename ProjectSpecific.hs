module ProjectSpecific(
  makeParameters
 ,makeAllParameters)
  where

import LibHaskell.LibLists
import LibHaskell.LibStrings

--say|tell_cout
makeParameters :: String -> [(String,String)]
makeParameters x = sew (splitOn modX '|') $ churn y num
  where num  = (length (splitOn x '|'))
	modX = coltil x '_'
	y    = after x '_'
	
makeAllParameters :: [String] -> [(String,String)]
makeAllParameters [] = []
makeAllParameters (x:xs) = makeParameters x ++ makeAllParameters xs