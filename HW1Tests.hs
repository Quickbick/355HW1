{- Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "run" at the Haskell prompt.  -} 

module HW1Tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- P1. merge_sorted tests

 
-- P2. sum_range tests


-- P3. (a) calc_collatz_seq and (b) longest_collatz_seq tests                                  


-- P4. (a) game_scores and (b) wins_by_year tests  (one test is sufficient for wins_by_year)                                

                                                           
-- P5. compress_str tests


-- add the test cases you created to the below list. 
tests = TestList [ 
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests