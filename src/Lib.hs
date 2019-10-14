module Lib where

maxs :: (Ord a) => [a] -> a
maxs = foldl1 max
-- maxs [x] = x
-- maxs (x:xs) = max x (maxs xs)

rev :: [a] -> [a]
rev = foldl (flip (:)) []
-- rev = rev' []
--       where
--         rev' r [] = r
--         rev' r (x:xs) = rev' (x:r) xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y = foldr (\x r -> (x == y) || r) False
-- elem' _ [] = False
-- elem' y (x:xs) = if (x == y) then True else elem' y xs

product' :: (Num a) => [a] -> a
product' = foldl (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\i a -> if p i then i:a else a) []
-- filter' p [] = []
-- filter' p (h:t) = if (p h) then (h:(filter' p t)) else filter' p t

head' :: [a] -> a
head' = foldr1 const

last' :: [a] -> a
last' = foldr1 (\_ x -> x)

mapr :: (a -> b) -> [a] -> [b]
mapr m = foldr ((:).m) []

mapl :: (a -> b) -> [a] -> [b]
mapl m = reverse.mapList
 where
  mapList = foldl mapAndConcat []
  mapAndConcat a i = (m i):a
