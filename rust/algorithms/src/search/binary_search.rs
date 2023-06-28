/*
Algorithm 2 - Binary Search

Time Complexity: O(log n) because we are dividing the array into half in each iteration.
Space Complexity: O(1) because we do not allocate any extra space to store the array elements.

If element is not found, return -1
 */

pub fn binary_search<T: PartialOrd + std::fmt::Debug>(
    element: &T,
    collection: &[T],
) -> Result<usize, &'static str> {
    let array_size = collection.len();
    if array_size == 0 {
        return Err("Empty array");
    }

    let mut low = 0;
    let mut high = array_size - 1;

    while low <= high {
        let mid = low + (high - low) / 2;
        if collection[mid] == *element {
            return Ok(mid);
        } else if collection[mid] < *element {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    Err("Element not found")
}
