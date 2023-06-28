use array::ArrayTrait;
use option::OptionTrait;
use algorithms_data_structures::utils::array_slice;

const ZERO_USIZE: usize = 0;

#[derive(Drop)]
struct Stack {
    elements: Array<u256>, 
}

trait StackTrait {
    fn new() -> Stack;
    fn push(ref self: Stack, value: u256);
    fn pop(ref self: Stack) -> Option<u256>;
    fn peek(self: @Stack) -> Option<u256>;
    fn len(self: @Stack) -> usize;
    fn is_empty(self: @Stack) -> bool;
}

impl StackImpl of StackTrait {
    fn new() -> Stack {
        let mut elements = ArrayTrait::new();
        Stack { elements }
    }

    fn push(ref self: Stack, value: u256) {
        let Stack{mut elements } = self;
        elements.append(value);
        self = Stack { elements }
    }

    fn pop(ref self: Stack) -> Option<u256> {
        if self.is_empty() {
            return Option::None(());
        }

        let Stack{elements: mut elements } = self;
        let stack_len = elements.len();
        let last_idx = stack_len - 1;

        let sliced_elements = array_slice(@elements, begin: 0, end: last_idx);

        self = Stack { elements: sliced_elements };
        Option::Some(*elements[last_idx])
    }

    fn peek(self: @Stack) -> Option<u256> {
        if self.is_empty() {
            return Option::None(());
        }
        Option::Some(*self.elements[self.elements.len() - 1])
    }

    fn len(self: @Stack) -> usize {
        self.elements.len()
    }

    fn is_empty(self: @Stack) -> bool {
        self.len() == ZERO_USIZE
    }
}