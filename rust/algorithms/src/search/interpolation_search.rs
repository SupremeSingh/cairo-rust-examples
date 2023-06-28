/*
Algorithm 3 - Interpolation Search

Time Complexity: O(log log n) if the elements are uniformly distributed.
Space Complexity: O(1) because we do not allocate any extra space to store the array elements.

If element is not found, return -1
 */


pub fn interpolation_search(
    arr: &[i32],
    target: &i32,
) -> Result<usize, usize> {
    // 1. Handle empty sequence.
    if arr.is_empty() {
        return Err(0)
    }

    // 2. Setup variable storing iteration informaion.
    let mut hi = arr.len() - 1;
    let mut lo = 0_usize;

    let mut interpolant = 0_usize;

    // 3. Main loop to calculate the interpolant.
    loop {
        let lo_val = arr[lo];
        let hi_val = arr[hi];

        // 3.1. Three condition to exit the loop
        if hi <= lo || *target < lo_val || *target > hi_val {
            break
        }

        // 3.2. The linear interpolation part
        let offset = (*target - lo_val) * (hi - lo) as i32 / (hi_val - lo_val);
        interpolant = lo + offset as usize;

        let mid_val = arr[interpolant];

        // 3.3. Comparison between the interpolant and targert value.
        if mid_val > *target {
            hi = interpolant - 1;
        } else if mid_val < *target {
            lo = interpolant + 1;
        } else {
            break
        }
    }

    // 4. Determine whether the returning interpolant are equal to target value.
    if *target > arr[hi] {
        Err(hi)
    } else if *target < arr[lo] {
        Err(lo)
    } else {
        Ok(interpolant)
    }
}
