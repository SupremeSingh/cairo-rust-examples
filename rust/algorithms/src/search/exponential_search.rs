/*
Algorithm 4 - Exponential Search

Time Complexity: O(log n) because it uses binary search
Space Complexity: O(1) because it uses iterative binary search

Return Err(0) if the element is not found
 */

pub fn exponential_search(element: &i32, collection: &[i32]) -> Result<usize, usize> {
    // 1. Handle empty sequence.
    if collection.is_empty() {
        return Err(0)
    }

    // 2. Setup variable storing iteration informaion.
    let mut bound = 1_usize;

    // 3. Main loop to calculate the interpolant.
    while bound < collection.len() && collection[bound] < *element {
        bound *= 2;
    }

    // 4. Binary search
    let mut lo = bound / 2;
    let mut hi = std::cmp::min(bound, collection.len() - 1);

    while lo <= hi {
        let mid = lo + (hi - lo) / 2;

        if collection[mid] == *element {
            return Ok(mid)
        } else if collection[mid] < *element {
            lo = mid + 1;
        } else {
            hi = mid - 1;
        }
    }

    Err(0)
}