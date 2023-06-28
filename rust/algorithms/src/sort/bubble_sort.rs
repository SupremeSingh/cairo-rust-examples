/*
Algorithm 3 - Bubble Sort

Time Complexity: O(n^2) because of the nested loops
Space Complexity: O(1) because we are not using extra space to store the sorted array

Return the array if the array has less than 2 elements
 */

pub fn bubble_sort<T: PartialOrd + std::fmt::Debug>(collection: &mut [T]) {
    let size = collection.len();
    if size < 2 {
        return;
    }

    for i in 0..size {
        for j in 0..size-i-1 {
            if collection[j] > collection[j+1] {
                collection.swap(j, j+1);
            }
        }
    }
}