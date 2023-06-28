use array::ArrayTrait;
use option::OptionTrait;
use debug::PrintTrait;
use algorithms_sort::utils::is_equal;
use algorithms_sort::bubble_sort::bubble_sort;

#[test]
#[available_gas(200000000000000)]
fn bubble_sort_test() {
    let mut data = ArrayTrait::new();
    data.append(0);
    data.append(2);
    data.append(1);
    data.append(3);

    let mut correct = ArrayTrait::new();
    correct.append(0);
    correct.append(1);
    correct.append(2);
    correct.append(3);

    let mut sorted: Array<u32> = bubble_sort(data).unwrap();
    assert(is_equal(ref sorted, ref correct, 0) == true, 'invalid result');
}

#[test]
#[available_gas(200000000000)]
fn bubble_sort_test_empty() {
    let mut data = ArrayTrait::new();

    let mut correct = ArrayTrait::new();

    let mut sorted = bubble_sort(data).unwrap();

    assert(is_equal(ref sorted, ref correct, 0) == true, 'invalid result');
}

#[test]
#[available_gas(200000000000)]
fn bubble_sort_test_one_element() {
    let mut data = ArrayTrait::new();
    data.append(2);

    let mut correct = ArrayTrait::new();
    correct.append(2);

    let mut sorted = bubble_sort(data).unwrap();

    assert(is_equal(ref sorted, ref correct, 0) == true, 'invalid result');
}

#[test]
#[available_gas(200000000000)]
fn bubble_sort_test_pre_sorted() {
    let mut data = ArrayTrait::new();
    data.append(1);
    data.append(2);
    data.append(3);
    data.append(4);

    let mut correct = ArrayTrait::new();
    correct.append(1);
    correct.append(2);
    correct.append(3);
    correct.append(4);

    let mut sorted = bubble_sort(data).unwrap();

    assert(is_equal(ref sorted, ref correct, 0) == true, 'invalid result');
}


