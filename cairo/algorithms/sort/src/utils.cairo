use core::box::BoxTrait;
use array::ArrayTrait;
use option::OptionTrait;

fn swap<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TEq: PartialEq<T>>(
    array: Array<T>, i: usize, j: usize
) -> Option<Array<T>> {
    let size: usize = array.len();

    if size < 2 {
        return Option::None(());
    }
    if i < 0 | j < 0 | i >= size | j >= size {
        return Option::None(());
    }

    let mut index = 0;
    let mut new_array: Array<T> = ArrayTrait::new();
    loop {
        if index >= size {
            break ();
        }
        if index == i {
            new_array.append(*array[j]);
        } else if index == j {
            new_array.append(*array[i]);
        } else {
            new_array.append(*array[index]);
        }
        index += 1;
    };

    return Option::Some(new_array);
}

fn is_equal(ref a: Array<u32>, ref b: Array<u32>, index: u32) -> bool {
    let len = a.len();
    if len != b.len() {
        return false;
    }
    let mut i = 0_u32;
    if index == len {
        return true;
    }

    if *a[index] != *b[index] {
        return false;
    }

    is_equal(ref a, ref b, index + 1)
}
