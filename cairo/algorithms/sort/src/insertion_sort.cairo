use core::clone::Clone;
use array::ArrayTrait;
use option::OptionTrait;
use algorithms_sort::utils::swap;


fn insertion_sort<
    T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TOr: PartialOrd<T>, impl TEq: PartialEq<T>
>(
    array: Array<T>
) -> Option<Array<T>> {
    let size = array.len();
    if size < 2 {
        return Option::Some(array);
    }
    let mut index1 = 1;
    let mut sorted_arrays: Array<Array<T>> = ArrayTrait::new();
    sorted_arrays.append(array);
    loop {
        if index1 == size {
            break ();
        }
        let mut index2 = index1 - 1;
        loop {
            let mut last_array: Array<T> = sorted_arrays[sorted_arrays.len() - 1].clone();
            if index2 < 0 | *last_array[index2] < *last_array[index1] {
                break ();
            }

            let swapped_array = swap(last_array, index2, index1).unwrap();
            sorted_arrays.append(swapped_array);
            index2 -= 1;
        };

        index1 += 1;
    };
    let result = sorted_arrays[sorted_arrays.len() - 1].clone();
    return Option::Some(result);
}

