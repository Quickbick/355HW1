{-  To run the tests type "run" at the Haskell prompt.  -} 

module P4_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- Problem-4 test data
-- make sure that the below list is not defined in HW1.hs
wsu_games = [
    (2019, [("NMSU",(58,7)), ("UNCO",(59,17)), ("HOU",(31,24)), ("UCLA",(63,67)), ("UTAH",(13,38)), 
            ("ASU",(34,38)), ("COLO",(41,10)), ("ORE",(35,37)), ("CAL",(20,33)), ("STAN",(49,22)), 
            ("ORST",(54,53)), ("WASH",(13,31)), ("AFA",(21,31))]),
    (2020, [("ORST",(38,28)), ("ORE",(29,43)), ("USC",(13,38)), ("UTAH",(28,45))]),
    (2021, [("USU",(23,26)), ("PORT ST.",(44,24)), ("USC",(14,45)), ("UTAH",(13,24)), ("CAL",(21,6)),
            ("ORST",(31,24)), ("STAN",(34,31)), ("BYU",(19,21)), ("ASU",(34,21)), ("ORE",(24,38)), 
            ("ARIZ",(44,18)), ("WASH",(40,13)), ("CMU",(21,24))] )
            ]

-- game_scores tests                                  
p4a_test1 = TestCase (assertEqual "game_scores-test1" 
                                  (sort [(13,38),(14,45)])  
                                  (sort $ game_scores wsu_games "USC") ) 
p4a_test2 = TestCase (assertEqual "game_scores-test2" 
                                  (sort [(54,53),(38,28),(31,24)]) 
                                  (sort $ game_scores wsu_games "ORST") ) 
p4a_test3 = TestCase (assertEqual "game_scores-test3" 
                                  [] 
                                  (sort $ game_scores wsu_games "YALE") ) 

-- wins_by_year tests                                  
p4b_test1 = TestCase (assertEqual "wins_by_year-test1" 
                                  (sort [(2019,6),(2020,1),(2021,7)])  
                                  (sort $ wins_by_year wsu_games) ) 
                                                          

tests = TestList [                                      
                   TestLabel "Problem 4- test1 " p4a_test1, 
                   TestLabel "Problem 4- test2 " p4a_test2,
                   TestLabel "Problem 4- test3 " p4a_test3, 
                   TestLabel "Problem 4- test4 " p4b_test1
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests