
use array::ArrayTrait;

fn array_slice(src: @Array<u256>, mut begin: usize, end: usize) -> Array<u256> {
    let mut slice = ArrayTrait::new();
    let len = begin + end;
    loop {
        if begin >= len {
            break ();
        }
        if begin >= src.len() {
            break ();
        }

        slice.append(*src[begin]);
        begin += 1;
    };
    slice
}