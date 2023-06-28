use array::{SpanTrait, ArrayTrait};
use debug::PrintTrait;
use option::OptionTrait;

fn binary_search<
    T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TEq: PartialEq<T>, impl TOr: PartialOrd<T>
>(
    span: Span<T>, val: T
) -> Option<u32> {
    // Initial check
    if (span.len() == 0) {
        return Option::None(());
    }
    let middle = span.len() / 2;
    if (*span[middle] == val) {
        return Option::Some(middle);
    }
    if (span.len() == 1) {
        return Option::None(());
    }
    if (*span[middle] > val) {
        return (binary_search(span.slice(0, middle), val));
    }

    let mut len = middle;
    if (span.len() % 2 == 1) {
        len += 1;
    }
    let val = binary_search(span.slice(middle, len), val);
    match val {
        Option::Some(v) => Option::Some(v + middle),
        Option::None(()) => Option::None(())
    }
}
// fn main() {
//     let mut arr: Array<u128> = ArrayTrait::new();

//     arr.append(100); // 0
//     arr.append(200); // 1
//     arr.append(300); // 2
//     arr.append(400); // 3
//     arr.append(500); // 4
//     arr.append(600); // 5

//     let mut span = arr.span();

//     let x = binary_search(span, 300).unwrap();
// }


