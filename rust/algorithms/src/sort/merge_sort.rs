/*
Algorithm 2 - Merge Sort

Time Complexity: O(nlogn) because of the nested loops
Space Complexity: O(n) because we are using extra space to store the sorted array

Return the array if the array has less than 2 elements
 */

pub fn merge_sort<T: PartialOrd + Clone>(arr: &[T]) -> Vec<T> {
    if arr.len() <= 1 {
        return arr.to_vec();
    }

    let mid = arr.len() / 2;
    let left = merge_sort(&arr[..mid]);
    let right = merge_sort(&arr[mid..]);

    merge(&left, &right)
}

fn merge<T: PartialOrd + Clone>(left: &[T], right: &[T]) -> Vec<T> {
    let mut merged = Vec::with_capacity(left.len() + right.len());
    let mut i = 0;
    let mut j = 0;

    while i < left.len() && j < right.len() {
        if left[i] <= right[j] {
            merged.push(left[i].clone());
            i += 1;
        } else {
            merged.push(right[j].clone());
            j += 1;
        }
    }

    if i < left.len() {
        merged.extend_from_slice(&left[i..]);
    }

    if j < right.len() {
        merged.extend_from_slice(&right[j..]);
    }

    merged
}
