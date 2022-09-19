-- CptS 355 - Fall 2022 -- Homework1 - Haskell
-- Name: Nathanael Ostheller

module HW1
     where

-- P1 - merge_sorted 10%
merge_sorted :: Ord a => [a] -> [a] -> [a]
merge_sorted [] [] = []
merge_sorted (x:xs) [] = (x:xs)
merge_sorted [] (d:ds) = (d:ds)
merge_sorted (x:xs) (d:ds) | x > d = d : (merge_sorted (x:xs) ds)
                           | d > x = x : (merge_sorted xs (d:ds))
                           | x == d = x : d : (merge_sorted xs ds)

-- P2  sum_range  15%


-- P3  (a) calc_collatz_seq ; 10%


-- P3  (b) longest_collatz_seq ; 15%


-- P4  (a) game_scores ; 15%


-- P4  (b) wins_by_year ; 10%


-- P5  compress_str ; 15% 



-- Assignment rules ; 4%
-- Your own tests ; 6%



