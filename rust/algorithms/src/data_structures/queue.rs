/*
Data Structure 2 - Queue

Works with FIFO (First In First Out) principle
Relies on contiguous memory allocation
Use Vec<T> since it has dynamic size
 */

pub struct Queue<T> {
    queue: Vec<T>
}

impl<T> Queue<T> {
    pub fn new() -> Queue<T> {
        Queue {queue: Vec::new()}
    }

    pub fn dequeue(&mut self) -> Option<T> {
        if self.queue.is_empty() {
            None
        } else {
            Some(self.queue.remove(0))
        }
    }

    pub fn enqueue(&mut self, item: T) {
        self.queue.push(item);
    }

    pub fn peek(&self) -> Option<&T> {
        self.queue.first()
    }

    pub fn is_empty(&self) -> bool {
        self.queue.is_empty()
    }

    pub fn size(&self) -> usize {
        self.queue.len()
    }

    pub fn peek_mut(&mut self) -> Option<&mut T> {
        self.queue.first_mut()
    }
}