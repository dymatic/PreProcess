module Replace(
  replace
 ,replaceAll
 ,repl
 ,replList) where

import LibHaskell.LibLists

replace :: (Eq a) => [a] -> [(a,a)] -> [a]
replace [] _ = []
replace (x:xs) ys
	| x `inFst` ys = look x ys : rest
	| otherwise = x : rest
	where rest = replace xs ys

replaceAll' :: (Eq a) => [[a]] -> [(a,a)] -> [[a]]
replaceAll' fs ys = map ((flip replace) ys) fs

replaceList :: (Eq a) => [a] -> ([a],[a]) -> [a]
replaceList [] _ = []
replaceList z@(x:xs) (a,b)
	| take (length a) z == a = b ++ strt z (length a)
	| otherwise = x : replaceList xs (a,b)

--General replacing function. Use this is most instances.
repl :: Eq a => [a] -> [([a], [a])] -> [a]
repl x []     = x
repl x (y:ys) = repl (replaceList x y) ys

replList :: Eq a => [[a]] -> [([a],[a])] -> [[a]]
replList x ys = map ((flip repl) ys) x
