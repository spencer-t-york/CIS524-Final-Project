module Main where

import Test.QuickCheck
import MergeSort (mergeSort)
import Data.List (sort)

-- Sorted output should match Data.List.sort (the standard library sort)
prop_correctSort :: [Int] -> Bool
prop_correctSort xs = mergeSort xs == sort xs

-- Output length should equal input length
prop_length :: [Int] -> Bool
prop_length xs = length (mergeSort xs) == length xs

-- Sorting an already sorted list should change nothing
prop_idempotent :: [Int] -> Bool
prop_idempotent xs = mergeSort (mergeSort xs) == mergeSort xs

main :: IO ()
main = do
    quickCheck prop_correctSort
    quickCheck prop_length
    quickCheck prop_idempotent