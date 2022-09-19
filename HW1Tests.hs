{- Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "run" at the Haskell prompt.  -} 

module HW1Tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

wsu_games = [
    (2019, [("NMSU",(58,7)), ("UNCO",(59,17)), ("HOU",(31,24)), ("UCLA",(63,67)), ("UTAH",(13,38)), 
            ("ASU",(34,38)), ("COLO",(41,10)), ("ORE",(35,37)), ("CAL",(20,33)), ("STAN",(49,22)), 
            ("ORST",(54,53)), ("WASH",(13,31)), ("AFA",(21,31))]),
    (2020, [("ORST",(38,28)), ("ORE",(29,43)), ("USC",(13,38)), ("UTAH",(28,45))]),
    (2021, [("USU",(23,26)), ("PORT ST.",(44,24)), ("USC",(14,45)), ("UTAH",(13,24)), ("CAL",(21,6)),
            ("ORST",(31,24)), ("STAN",(34,31)), ("BYU",(19,21)), ("ASU",(34,21)), ("ORE",(24,38)), 
            ("ARIZ",(44,18)), ("WASH",(40,13)), ("CMU",(21,24))] )
            ]

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
p3_test3 = TestCase (assertEqual "longest_collatz_seq-test1"
                                 [3,10,5,16,8,4,2,1]
                                 (longest_collatz_seq 4) )
p3_test4 = TestCase (assertEqual "longest_collatz_seq-test2"
                                 [7,22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
                                 (longest_collatz_seq 8) )

-- P4. (a) game_scores and (b) wins_by_year tests  (one test is sufficient for wins_by_year)                                
p4_test1 = TestCase (assertEqual "game_scores-test1"
                                 (sort [(58,7)])
                                 (sort $ game_scores wsu_games "NMSU") )
p4_test2 = TestCase (assertEqual "game_scores-test2"
                                  (sort [(13,31),(40,13)])  
                                  (sort $ game_scores wsu_games "WASH") )                                                
-- P5. compress_str tests


-- add the test cases you created to the below list. 
tests = TestList [ TestLabel "Problem 1 - Test 1" p1_test1,
                   TestLabel "Problem 1 - Test 2" p1_test2,
                   TestLabel "Problem 2 - Test 1" p2_test1,
                   TestLabel "Problem 2 - Test 2" p2_test2,
                   TestLabel "Problem 3a - Test 1" p3_test1,
                   TestLabel "Problem 3a - Test 2" p3_test2,
                   TestLabel "Problem 3b - Test 1" p3_test3,
                   TestLabel "Problem 3b - Test 2" p3_test4,
                   TestLabel "Problem 4a - Test 1" p4_test1,
                   TestLabel "Problem 4a - Test 2" p4_test2
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests