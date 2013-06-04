module ProjectSpecific(
  makeParameters
 ,makeAllParameters
 ,sanitize)
  where

import Archimedes.Sequence.Manipulate
import Archimedes.Sequence.Manipulate
import Archimedes.Sequence.Functional
import Archimedes.Sequence.Remove

churn :: a -> Int -> [a]
churn x t = take t (repeat x)

--Can handle say_cout \n yell_cout or say|tell_cout
makeParameters :: String -> [(String,String)]
makeParameters x = zip (splitOn modX '|') $ churn y num
  where num  = (length (splitOn x '|'))
	modX = before x '_'
	y    = after x '_'
	
makeAllParameters :: [String] -> [(String,String)]
makeAllParameters [] = []
makeAllParameters (x:xs) = makeParameters x ++ makeAllParameters xs

--Removes strings between $'s, saves $'s in lines with an @ symbol.
sanitize :: [String] -> [String]
sanitize [] = []
sanitize (x:xs)
  | '@' `elem` x = x : sanitize xs
  | '$' `elem` x = removeBetween x ('$','$') : sanitize xs
  | (length x) < 4 = sanitize xs
  | otherwise = x : sanitize xs
