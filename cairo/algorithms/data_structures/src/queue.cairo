use array::ArrayTrait;
use option::OptionTrait;
use algorithms_data_structures::utils::array_slice;

const ZERO_USIZE: usize = 0;

#[derive(Drop)]
struct Queue {
    elements: Array<u256>, 
}

trait QueueTrait {
    fn new() -> Queue;
    fn enqueue(ref self: Queue, element: u256);
    fn dequeue(ref self: Queue) -> Option<u256>;
    fn peek_front(self: @Queue) -> Option<u256>;
    fn is_empty(self: @Queue) -> bool;
    fn size(self: @Queue) -> usize;
}

impl QueueImpl of QueueTrait {
    fn new() -> Queue {
        Queue {elements: ArrayTrait::new()}
    }
    fn enqueue(ref self: Queue, element: u256) {
        let Queue {mut elements} = self; 
        elements.append(element);
        self = Queue {elements: elements};
    }
    fn dequeue(ref self: Queue) -> Option<u256> {
        if self.is_empty() {
            return Option::None(());
        }
        
        let Queue {mut elements} = self;
        let first_element = *elements[ZERO_USIZE];
        
        let sliced_elements = array_slice(@elements, begin: 1, end: elements.len());
        self = Queue {elements: sliced_elements};
        Option::Some(first_element)
    }
    fn peek_front(self: @Queue) -> Option<u256> {
        let Queue {elements} = self;
        Option::Some(*elements[ZERO_USIZE])
    }
    fn is_empty(self: @Queue) -> bool {
        self.size() == ZERO_USIZE
    }
    fn size(self: @Queue) -> usize {
        let Queue {elements} = self;
        elements.len()
    }
}
