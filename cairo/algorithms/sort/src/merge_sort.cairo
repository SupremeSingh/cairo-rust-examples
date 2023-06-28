use array::ArrayTrait;

fn merge_sort<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TPartialOrd: PartialOrd<T>>(
    mut arr: Array<T>
) -> Array<T> {
    let len = arr.len();
    if len < 2 {
        return arr;
    }

    let middle = len / 2;
    let (mut left_arr, mut right_arr) = split_array(ref arr, middle);

    let mut sorted_left = merge_sort(left_arr);
    let mut sorted_right = merge_sort(right_arr);

    let mut result_arr = ArrayTrait::new();
    merge_recursive(sorted_left, sorted_right, ref result_arr, 0, 0);
    result_arr
}

fn merge_recursive<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TPartialOrd: PartialOrd<T>>(
    mut left_arr: Array<T>,
    mut right_arr: Array<T>,
    ref result_arr: Array<T>,
    left_arr_ix: usize,
    right_arr_ix: usize
) {
    if result_arr.len() == left_arr.len() + right_arr.len() {
        return ();
    }

    if left_arr_ix == left_arr.len() {
        result_arr.append(*right_arr[right_arr_ix]);
        return merge_recursive(left_arr, right_arr, ref result_arr, left_arr_ix, right_arr_ix + 1);
    }

    if right_arr_ix == right_arr.len() {
        result_arr.append(*left_arr[left_arr_ix]);
        return merge_recursive(left_arr, right_arr, ref result_arr, left_arr_ix + 1, right_arr_ix);
    }

    if *left_arr[left_arr_ix] < *right_arr[right_arr_ix] {
        result_arr.append(*left_arr[left_arr_ix]);
        merge_recursive(left_arr, right_arr, ref result_arr, left_arr_ix + 1, right_arr_ix)
    } else {
        result_arr.append(*right_arr[right_arr_ix]);
        merge_recursive(left_arr, right_arr, ref result_arr, left_arr_ix, right_arr_ix + 1)
    }
}

fn split_array<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(
    ref arr: Array<T>, index: usize
) -> (Array<T>, Array<T>) {
    let mut arr1 = ArrayTrait::new();
    let mut arr2 = ArrayTrait::new();
    let len = arr.len();

    fill_array(ref arr1, ref arr, 0_u32, index);
    fill_array(ref arr2, ref arr, index, len - index);

    (arr1, arr2)
}

fn fill_array<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(
    ref arr: Array<T>, ref fill_arr: Array<T>, index: usize, count: usize
) {
    if count == 0 {
        return ();
    }

    arr.append(*fill_arr[index]);

    fill_array(ref arr, ref fill_arr, index + 1, count - 1)
}
