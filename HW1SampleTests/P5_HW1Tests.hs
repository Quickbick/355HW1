{-  To run the tests type "run" at the Haskell prompt.  -} 

module P5_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1
                                                   
-- compress_str  tests 
                                
p5_test1 = TestCase (assertEqual "(compress_str-test1)" 
                                  "abca3b3" 
                                  (compress_str "abcaaabbb") ) 
p5_test2 = TestCase (assertEqual "(compress_str-test2)" 
                                  "abcd"
                                  (compress_str "abcd") )                             
p5_test3 = TestCase (assertEqual "(compress_str-test3)" 
                                  "a3ba4c2a4ba"
                                  (compress_str "aaabaaaaccaaaaba") )                           

tests = TestList [                                      
                   TestLabel "Problem 5a- test1 " p5_test1, 
                   TestLabel "Problem 5a- test2 " p5_test2,
                   TestLabel "Problem 5a- test3 " p5_test3
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests