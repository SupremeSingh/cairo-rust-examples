use array::{SpanTrait, ArrayTrait};
use option::OptionTrait;

fn interpolation_search(span: Span<u32>, val: u32) -> Option<u32> {
    let size = span.len();

    // Handle empty span
    if size == 0 {
        return Option::None(());
    }

    // Handle single element span
    if size == 1 {
        if *span[0] == val {
            return Option::Some(0);
        } else {
            return Option::None(());
        }
    }

    // Create bounds
    let mut low = 0;
    let mut high = size - 1;

    if low > high | val < *span[low] | val > *span[high] {
        return Option::None(());
    }

    let pos = low + ((val - *span[low]) * (high - low)) / (*span[high] - *span[low]);

    // Recursive search
    if *span[pos] == val {
        return Option::Some(pos);
    } else if *span[pos] < val {
        return interpolation_search(span.slice(pos + 1, size), val);
    } else {
        return interpolation_search(span.slice(0, pos - 1), val);
    }
}
