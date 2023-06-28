/*
Algorithm 1 - Insertion Sort

Time Complexity: O(n^2) because of the nested loops
Space Complexity: O(1) because we are not using any extra space

Return -1 if the array is empty
 */

pub fn insertion_sort<T: PartialOrd + std::fmt::Debug>(collection: &mut [T]) {
    let size = collection.len();
    if size < 2 {
        return;
    }

    for mut i in 1..size {
        while collection[i] < collection[i-1] {
            collection.swap(i, i-1);
            if i > 1 {
                i -= 1;
            } else {
                break;
            }
        }
    }
}
