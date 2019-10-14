{-# OPTIONS_GHC -F -pgmF htfpp #-}
import Lib
import Test.Framework

main = htfMain htf_thisModulesTests

test_maxs = do assertEqual 3 $ maxs [1,2,3]

test_rev = do assertEqual [3,2,1] $ rev [1,2,3]

test_elem = do
  assertEqual True $ elem 3 [1,2,3]
  assertEqual False $ elem 4 [1,2,3]

test_product = do
  assertEqual 6 $ product' [1,2,3]

test_filter = do
  assertEqual [2,4,6] $ filter' even [1,2,3,4,5,6]

test_head = do
  assertEqual 2 $ head' [2,3,5]

test_last = do
  assertEqual 5 $ last' [2,3,5]

test_mapr = do
  assertEqual [2,4,6] $ mapr (*2) [1,2,3]

test_mapl = do
  assertEqual [2,4,6] $ mapl (*2) [1,2,3]
