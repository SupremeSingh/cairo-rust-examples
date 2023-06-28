#[cfg(test)]
mod stack_test {
    use algorithms::data_structures::queue::Queue;

    #[test]
    fn test_queue_empty() {
        let mut queue: Queue<i32> = Queue::new();
        assert_eq!(queue.dequeue(), None);
    }

    #[test]
    fn test_queue_enqueue() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        assert_eq!(queue.dequeue(), Some(1));
    }

    #[test]
    fn test_queue_enqueue_dequeue() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        queue.enqueue(2);
        assert_eq!(queue.dequeue(), Some(1));
        assert_eq!(queue.dequeue(), Some(2));
    }

    #[test]
    fn test_queue_peek() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        queue.enqueue(2);
        assert_eq!(queue.peek(), Some(&1));
        assert_eq!(queue.peek(), Some(&1));
    }

    #[test]
    fn test_queue_peek_mut() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        queue.enqueue(2);
        assert_eq!(queue.peek_mut(), Some(&mut 1));
        assert_eq!(queue.peek_mut(), Some(&mut 1));
    }

    #[test]
    fn test_queue_peek_mut_dequeue() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        queue.enqueue(2);
        assert_eq!(queue.peek_mut(), Some(&mut 1));
        assert_eq!(queue.dequeue(), Some(1));
    }

    #[test]
    fn test_queue_peek_mut_dequeue_peek() {
        let mut queue: Queue<i32> = Queue::new();
        queue.enqueue(1);
        queue.enqueue(2);
        assert_eq!(queue.peek_mut(), Some(&mut 1));
        assert_eq!(queue.dequeue(), Some(1));
        assert_eq!(queue.peek_mut(), Some(&mut 2));
    }
}

