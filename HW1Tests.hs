{- Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "run" at the Haskell prompt.  -} 

module HW1Tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- P1. merge_sorted tests
p1_test1 = TestCase (assertEqual"merge_sorted-test1"
                                  [1,1,1,1,2,4]
                                  (merge_sorted [1,1,1,4] [1,2]) )
p1_test2 = TestCase (assertEqual"merge_sorted-test2"
                                  "abcxyz"
                                  (merge_sorted "abcz" "xy") )
 
-- P2. sum_range tests
p2_test1 = TestCase (assertEqual "sum_range-test1"
                                 0
                                 (sum_range (0,0) [0, 1, 2]) )
p2_test2 = TestCase (assertEqual "sum_range-test2"
                                 19
                                 (sum_range (9,10) [0,1,2,3,4,5,6,7,8,9, 10]) )

-- P3. (a) calc_collatz_seq and (b) longest_collatz_seq tests                                  
p3_test1 = TestCase (assertEqual "calc_collatz_seq-test1"
                                 [22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
                                 (calc_collatz_seq 22) )
p3_test2 = TestCase (assertEqual "calc_collatz_seq-test2"
                                 [4,2,1]
                                 (calc_collatz_seq 4) )

-- P4. (a) game_scores and (b) wins_by_year tests  (one test is sufficient for wins_by_year)                                

                                                           
-- P5. compress_str tests


-- add the test cases you created to the below list. 
tests = TestList [ TestLabel "Problem 1 - Test 1" p1_test1,
                   TestLabel "Problem 1 - Test 2" p1_test2,
                   TestLabel "Problem 2 - Test 1" p2_test1,
                   TestLabel "Problem 2 - Test 2" p2_test2,
                   TestLabel "Problem 3a - Test 1" p3_test1,
                   TestLabel "Problem 3a - Test 2" p3_test2
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests