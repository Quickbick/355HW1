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
sum_range :: (Ord a, Num p, Num a) => (a, a) -> [p] -> p 
sum_range (0, 0) (x:xs) = x
sum_range (0 , n) (x:xs) = x + (sum_range (0, n - 1) xs)
sum_range (b, n) (x:xs) = sum_range (b - 1, n - 1) xs

-- P3  (a) calc_collatz_seq ; 10%
calc_collatz_seq :: Integral a => a -> [a]
calc_collatz_seq 1 = [1]
calc_collatz_seq n | (n `mod` 2) == 0 = n : (calc_collatz_seq (n `div` 2))
                   | otherwise = n : (calc_collatz_seq ((3*n) + 1))

-- P3  (b) longest_collatz_seq ; 15%
longest_collatz_seq :: Integral a => a -> [a]
longest_collatz_seq n = (collatz_comp n (n - 1))
     where
          collatz_comp n 0 = calc_collatz_seq n
          collatz_comp n x | (length (calc_collatz_seq n)) >= (length (calc_collatz_seq x)) = collatz_comp n (x-1)
          collatz_comp n x | (length (calc_collatz_seq x)) > (length (calc_collatz_seq n)) = collatz_comp x (x-1)

-- P4  (a) game_scores ; 15%
game_scores :: Eq t => [(a1, [(t, a2)])] -> t -> [a2]
game_scores [] name = []
game_scores ((x,[]):xs) name = game_scores xs name
game_scores ((x,(str, (w)):ws):xs) name | name == str = w : (game_scores ((x,ws):xs) name)
                                        | otherwise = game_scores ((x,ws):xs) name

-- P4  (b) wins_by_year ; 10%
wins_by_year :: (Num b, Ord a1) => [(a2, [(a3, (a1, a1))])] -> [(a2, b)]
wins_by_year [] = []
wins_by_year ((x,((str, (w, o)):ws)):xs) = (x, (count_wins ((str, (w, o)):ws) 0)) : (wins_by_year xs)
     where
          count_wins [] n = n
          count_wins ((str, (w, o)):ws) n | w > o = count_wins ws (n + 1)
                                          | otherwise = count_wins ws n

-- P5  compress_str ; 15% 
compress_str :: [Char] -> [Char]
compress_str [] = []
compress_str (x:xs) = compress_str_helper (x:xs) 1
     where
          compress_str_helper :: [Char] -> Int -> [Char]
          compress_str_helper [] n = []
          compress_str_helper [x] n | n == 1 = [x]
                                    | otherwise = x:(digit_to_char n)
                                        where
                                             digit_to_char x | x == 0 = ['0'] --didn't want to do this but it was 11pm and I ran out of ideas
                                                             | x == 1 = ['1']
                                                             | x == 2 = ['2']
                                                             | x == 3 = ['3']
                                                             | x == 4 = ['4']
                                                             | x == 5 = ['5']
                                                             | x == 6 = ['6']
                                                             | x == 7 = ['7']
                                                             | x == 8 = ['8']
                                                             | x == 9 = ['9']
          compress_str_helper (x:y:xs) n | x == y = compress_str_helper (x:xs) (n + 1)
                                         | (x /= y) && (n == 1) = x:(compress_str_helper (y:xs) n)
                                         | otherwise = x:(digit_to_char n):(compress_str_helper (y:xs) 1)
                                             where
                                                  digit_to_char x | x == 0 = '0'
                                                                  | x == 1 = '1'
                                                                  | x == 2 = '2'
                                                                  | x == 3 = '3'
                                                                  | x == 4 = '4'
                                                                  | x == 5 = '5'
                                                                  | x == 6 = '6'
                                                                  | x == 7 = '7'
                                                                  | x == 8 = '8'
                                                                  | x == 9 = '9'

-- Assignment rules ; 4%
-- Your own tests ; 6%



