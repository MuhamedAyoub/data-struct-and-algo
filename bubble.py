"""
@simple bubble sort using array data structure

"""
# ? O(n^2) time | O(1) space
my_array = [8, 5, 2, 9, 5, 5, 6, 3]


def swap(i, arr):
    arr[i], arr[i+1] = arr[i+1], arr[i]


def bubble_sort(Base_arr):
    # take a copy
    arr = [*Base_arr]
    is_sorted = False
    while not is_sorted:
        is_sorted = True
        for i in range(len(arr) - 1):
            if (arr[i] > arr[i+1]):
                swap(i, arr)
                is_sorted = False
    return arr


my_sort_array = bubble_sort(my_array)
print(my_array)
print('*'*20)
print(my_sort_array)
