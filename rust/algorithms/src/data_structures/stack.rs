/*
Data Structure 1 - Stack

Works with LILO (Last In Last Out) principle
Relies on contiguous memory allocation
Use Vec<T> since it has dynamic size
*/

pub struct Stack<T> {
    stack: Vec<T>
}

impl<T> Stack<T> {
    pub fn new() -> Stack<T> {
        Stack {stack: Vec::new()}
    }

    pub fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    pub fn push(&mut self, item: T) {
        self.stack.push(item);
    }       

    pub fn peek(&self) -> Option<&T> {
        self.stack.last()
    }

    pub fn peek_mut(&mut self) -> Option<&mut T> {
        self.stack.last_mut()
    }

    pub fn is_empty(&self) -> bool {
        self.stack.is_empty()
    }

    pub fn size(&self) -> usize {
        self.stack.len()
    }
}


