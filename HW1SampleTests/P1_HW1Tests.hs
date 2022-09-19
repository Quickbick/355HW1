{-  To run the tests type "run" at the Haskell prompt.  -} 

module P1_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- merge_sorted tests
p1_test1 = TestCase (assertEqual "merge_sorted-test1" 
                                 [1,2,5,8,8,9,9,11,13,15,15]
                                 (merge_sorted [5,8,9,15] [1,2,8,9,11,13,15]) )
p1_test2 = TestCase (assertEqual "merge_sorted-test2" 
                                 "abdfghijkkmn"
                                 (merge_sorted "dfgkmn" "abhijk") ) 
p1_test3 = TestCase (assertEqual "merge_sorted-test3" 
                                 [1,2,3,4,5,5,6,7,8] 
                                 (merge_sorted [1,2,3,4,5] [5,6,7,8]) ) 
p1_test4 = TestCase (assertEqual "merge_sorted-test4" 
                                 [1,2,3] 
                                 (merge_sorted [1,2,3] []) )                                  
 
tests = TestList [ TestLabel "Problem 1- test1 " p1_test1,
                   TestLabel "Problem 1- test2 " p1_test2,  
                   TestLabel "Problem 1- test3 " p1_test3,
                   TestLabel "Problem 1- test4 " p1_test4                   
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests