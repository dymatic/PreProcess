
module LibHaskell.LibLists(
  strt
 ,pos
 ,posList
 ,delete
 ,delFirst
 ,insert
 ,occurences
 ,inFst
 ,look
 ,filterBreak
 ,after
 ,coltil
 ,churn
 ,sew
 ,append
 ,appendList
) where

-- For general lists not biased to a type.
strt :: (Eq a) => [a] -> Int -> [a]
strt [] _ = []
strt x 0 = x
strt (x:xs) t
	| t == 1 = xs
	| otherwise = strt xs (t - 1)

pos :: (Eq a) => [a] -> a -> Int
pos [] _ = -1
pos (x:xs) t
	| notElem t (x:xs) = -1
	| t == x = 0
	| otherwise = 1 + pos xs t

posList :: (Eq a) => [a] -> [a] -> Int
posList [] _ = -1
posList a@(x:xs) y
	| (take (length y) a) == y = 0
	| otherwise = 1 + posList xs y

delete :: (Eq a) => [a] -> [a] -> [a]
delete [] _ = []
delete a@(x:xs) y
	| y == take (length y) a = delete (strt a (length y)) y
	| otherwise = x : delete xs y

delFirst :: (Eq a) => [a] -> [a] -> [a]
delFirst a@(x:xs) ys
	| take (length ys) a == ys = strt xs $ (length ys) - 1
	| otherwise = x : delFirst xs ys

-- Indices start at 0
insert :: (Eq a) => [a] -> Int -> [a] -> [a]
insert xs wh ys = take (wh) xs ++ ys ++ strt xs wh

occurences :: (Eq a) => [a] -> a -> Int
occurences xs y = sum $ map (\a -> if a == y then 1 else 0) xs

inFst :: (Eq a) => a -> [(a,b)] -> Bool
inFst a xs = a `elem` (map fst xs)

--Associative Tupple Lookup
look :: (Eq a) => a -> [(a,a)] -> a
look a all@((b,c):xs)
	| not $ a `inFst` all = a
	| a == b = c
	| otherwise = look a xs

filterBreak :: (a -> Bool) -> [a] -> [a]
filterBreak _ [] = []
filterBreak fun (x:xs)
  | not (fun x) = []
  | otherwise = x : filterBreak fun xs

after :: (Eq a) => [a] -> a -> [a]
after x y = strt x $ 1 + (pos x y)

coltil :: (Eq a) => [a] -> a -> [a] -- Collect until you meet an element
coltil x y = take (pos x y) x

churn :: a -> Int -> [a]
churn x n
  | (n == 1) = x:[]
  | otherwise = x:churn x (n - 1)
  
  
sew :: [a] -> [b] -> [(a,b)]
sew [] _ = []
sew _ [] = []
sew (x:xs) (y:ys) = (x,y) : sew xs ys

append :: [a] -> a -> [a]
append [] b = b:[]
append (x:xs) b = x : append xs b

appendList :: [a] -> [a] -> [a]
appendList [] b = b++[]
appendList (x:xs) b = x : appendList xs b
