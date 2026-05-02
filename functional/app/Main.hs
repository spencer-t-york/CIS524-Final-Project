module Main where

import MergeSort (mergeSort)

main :: IO ()
main = do
    let unsorted  = [4, 3, 2, 5, 5, 2, 5, 6, 1] :: [Int]
    putStrLn $ "Unsorted: " ++ show unsorted
    putStrLn $ "Sorted:   " ++ show (mergeSort unsorted)