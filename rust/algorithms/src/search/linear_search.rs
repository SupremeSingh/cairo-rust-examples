/*
Algorithm 1 - Linear Search

Time Complexity: O(n) because we have to iterate through the entire array to find the element.
Space Complexity: O(1) because we do not allocate any extra space to store the array elements.

If element is not found, return -1

Note: Algorithm is implemented over a Generic type T, which can be compared.
 */

pub fn linear_search<T: PartialEq + std::fmt::Debug>(
    element: &T,
    collection: &[T],
) -> Option<usize> {
    for (index, item) in collection.iter().enumerate() {
        if item == element {
            return Some(index);
        }
    }
    None
}
