def merge(a: list, b: list) -> list:
    """Merges split lists into single sorted list. Compares each element of both
    lists and inserts values smallest to largest

    Args:
        a (list): first list 
        b (list): second list

    Returns:
        list: sorted list
    """
    # define variables
    arr = []        # initial empty list
    len_a = len(a)  # compute length of first list
    len_b = len(b)  # compute length of second list
    i = 0           # first list pointer
    j = 0           # second list pointer

    # loop through both list until one has reached the end
    while i < len_a and j < len_b:
        # compare elements in both list and insert the smallest into new list
        if a[i] <= b[j]:
            arr.append(a[i])
            i += 1
        else:
            arr.append(b[j])
            j += 1
    
    # fill in remaining values for other list
    arr += a[i:]    # Case 1: left left remaining
    arr += b[j:]    # Case 2: right list remaining

    # return sorted list
    return arr


def divide_arr(arr: list) -> list:
    """Split a list into two halves. If the length is odd, the first returned 
    half will be shorter (rounds down). Then calls merge on each split list

    Args:
        arr (list): input list

    Returns:
        list: sorted list
    """

    # compute the length of list upfront
    length = len(arr)

    # base case: if list has 1 or less elements
    if length <= 1:
        return arr

    # split list into halves
    mid = length // 2 
    left = arr[:mid]
    right = arr[mid:]

    
    arr_one = divide_arr(left)  # recursively split left list
    arr_two = divide_arr(right) # recursively split right list

    # merge split lists into sorted list
    return merge(arr_one, arr_two)


if __name__ == "__main__":
    data = [4, 3, 2, 5, 5, 2, 5, 6, 1]
    print(f"input: {data}")
    print(f"output: {divide_arr(data)}")
