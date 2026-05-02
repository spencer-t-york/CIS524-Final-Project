-- Merge Sort implementation in Haskell
module MergeSort where

-- | Split a list into two halves. If the length is odd, the first returned 
-- half will be shorter (rounds down)
halve
    :: [x]          -- ^ The input list
    -> ([x], [x])   -- ^ The tuple containing two lists
halve xs = splitAt (length xs `div` 2) xs
-- Uses built-in splitAt


-- | Merges split lists into single sorted list. Compares each element of both lists 
-- and inserts values smallest to largest
merge
    :: Ord x        -- ^ Requires list elements to be orderable for comparisons
    => ([x], [x])   -- ^ The input tuple containing two lists
    -> [x]          -- ^ The merged list
merge (xs, []) = xs     -- Case 1: left left remaining
merge ([], ys) = ys     -- Case 2: right list remaining
merge (x:xs, y:ys) =    -- Case 3: right and left list remaining
    -- add first element of first list. 
    -- Recurse on remaining first list and full second list
    if x <= y  then x : merge (xs, y:ys)
    -- add first element of second list. 
    -- Recurse on full first list and remaining second list
    else y : merge (x:xs, ys)


-- | Performs Merge Sort on single list
mergeSort 
    :: Ord x    -- ^ Requires list elements to be orderable for comparisons
    => [x]      -- ^ The input list to be sorted
    -> [x]      -- ^ The sorted list
mergeSort [] = []   -- Base Case 1: input list is empty. Returns empty list
mergeSort [x] = [x] -- Base Case 2: input list is one element. Returns single element
mergeSort xs = 
    let (left, right) = halve xs        -- Split list into two lists
        sortedLeft = mergeSort left     -- Recursively split left list
        sortedRight = mergeSort right   -- Recursively split right list
    in merge (sortedLeft, sortedRight)  -- Merge split lists into sorted list