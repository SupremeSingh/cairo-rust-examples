use traits::Into;
use array::ArrayTrait;
use option::OptionTrait;
use algorithms_data_structures::queue::QueueTrait;

#[test]
#[available_gas(2000000)]
fn queue_new_test() {
    let mut queue = QueueTrait::new();
    let result_len = queue.elements.len();

    assert(result_len == 0, 'queue length should be 0');
}

#[test]
#[available_gas(2000000)]
fn queue_is_empty_test() {
    let mut queue = QueueTrait::new();
    let result = queue.is_empty();

    assert(result == true, 'queue should be empty');
}

#[test]
#[available_gas(2000000)]
fn queue_push_test() {
    let mut queue = QueueTrait::new();
    let val_1: u256 = 1.into();
    let val_2: u256 = 2.into();

    queue.enqueue(val_1);
    queue.enqueue(val_2);

    let result_len = queue.elements.len();
    let result_is_empty = queue.is_empty();

    assert(result_is_empty == false, 'must not be empty');
    assert(result_len == 2, 'len should be 2');
}
#[test]
#[available_gas(2000000)]
fn queue_peek_test() {
    let mut queue = QueueTrait::new();
    let val_1: u256 = 1.into();
    let val_2: u256 = 2.into();

    queue.enqueue(val_1);
    queue.enqueue(val_2);
    match queue.peek_front() {
        Option::Some(result) => {
            assert(result == val_1, 'wrong result');
        },
        Option::None(_) => {
            assert(0 == 1, 'should return value');
        },
    };

    let result_len = queue.elements.len();
    assert(result_len == 2, 'should not remove items');
}

#[test]
#[available_gas(2000000)]
fn queue_pop_test() {
    let mut queue = QueueTrait::new();
    let val_1: u256 = 1.into();
    let val_2: u256 = 2.into();

    queue.enqueue(val_1);
    queue.enqueue(val_2);

    let value = queue.dequeue();
    match value {
        Option::Some(result) => {
            assert(result == val_1, 'wrong result');
        },
        Option::None(_) => {
            assert(0 == 1, 'should return a value');
        },
    };

    let result_len = queue.elements.len();
    assert(result_len == 1, 'should remove item');
}
