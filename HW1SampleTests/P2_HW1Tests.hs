{-  To run the tests type "run" at the Haskell prompt.  -} 

module P2_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1


-- sum_range tests
p2_test1 = TestCase (assertEqual "sum_range-test1" 
                                  25
                                  (sum_range (3,7) [0,1,2,3,4,5,6,7,8,9]) ) 
p2_test2 = TestCase (assertEqual "sum_range-test2" 
                                  15 
                                  (sum_range (0,5) [0,1,2,3,4,5,6,7,8,9])) 
p2_test3 = TestCase (assertEqual "sum_range-test3" 
                                  24  
                                  (sum_range (7,9)  [0,1,2,3,4,5,6,7,8,9]) ) 

tests = TestList [                  
                   TestLabel "Problem 2- test1 " p2_test1,
                   TestLabel "Problem 2- test2 " p2_test2,  
                   TestLabel "Problem 2- test3 " p2_test3
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests