use array::SpanTrait;

fn linear_search<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TEq: PartialEq<T>>(
    span: Span<T>, value: T
) -> Option<u32> {
    let size = span.len();
    if size == 0 {
        return Option::None(());
    }
    if *span[size - 1] == value {
        return Option::Some(size - 1);
    }
    return linear_search(span.slice(0, size - 1), value);
}

