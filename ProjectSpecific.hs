module ProjectSpecific(
  makeParameters
 ,makeAllParameters
 ,sanitize)
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

sanitize :: [String] -> [String]
sanitize [] = []
sanitize (x:xs)
  | '@' `elem` x = (rm x '@') : sanitize xs
  | and [((occurences x '$') `mod` 2 == 0),((occurences x '$') > 1)] = remAllBetwix x ('$','$') : sanitize xs
  | otherwise = x : sanitize xs