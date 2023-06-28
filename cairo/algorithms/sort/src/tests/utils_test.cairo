use algorithms_sort::utils::{swap, is_equal};
use array::ArrayTrait;
use option::OptionTrait;
use debug::PrintTrait;

#[test]
#[available_gas(2000000)]
fn test_u32_array() {
    let mut array: Array<u32> = ArrayTrait::new();
    array.append(1);
    array.append(2);
    array.append(3);
    array.append(4);
    array.append(5);

    let result: Array<u32> = swap(array, 0, 4).unwrap();
    assert(*result[0] == 5, 'swap failed');
    assert(*result[4] == 1, 'swap failed');
}

#[test]
#[available_gas(2000000)]
fn test_char_array() {
    let mut array: Array<felt252> = ArrayTrait::new();
    array.append('a');
    array.append('b');
    array.append('c');
    array.append('d');
    array.append('e');

    let result: Array<felt252> = swap(array, 0, 4).unwrap();
    assert(*result[0] == 'e', 'swap failed');
    assert(*result[4] == 'a', 'swap failed');
}

#[test]
#[available_gas(2000000)]
fn test_incorrect_length_array() {
    let mut array: Array<u32> = ArrayTrait::new();
    array.append(1);
    array.append(2);

    let result: Option<Array<u32>> = swap(array, 0, 4);
    assert(result.is_none() == true, 'swap failed');
}

#[test]
#[available_gas(2000000)]
fn test_zero_length_array() {
    let mut array: Array<u32> = ArrayTrait::new();
    let result: Option<Array<u32>> = swap(array, 0, 4);
    assert(result.is_none() == true, 'swap failed');
}

#[test]
#[available_gas(2000000)]
fn test_is_equal() {
    let mut array1: Array<u32> = ArrayTrait::new();
    array1.append(1);
    array1.append(2);
    array1.append(3);
    array1.append(4);
    array1.append(5);

    let mut array2: Array<u32> = ArrayTrait::new();
    array2.append(1);
    array2.append(2);
    array2.append(3);
    array2.append(4);
    array2.append(5);

    assert(is_equal(ref array1, ref array2, 0_u32) == true, 'is_equal failed');
}
