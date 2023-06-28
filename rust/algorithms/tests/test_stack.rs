#[cfg(test)]
mod stack_test {
    use algorithms::data_structures::stack::Stack;  

    #[test]
    fn test_stack_empty() {
        let mut stack: Stack<i32> = Stack::new();
        assert_eq!(stack.pop(), None);
    }

    #[test]
    fn test_stack_push() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        assert_eq!(stack.pop(), Some(1));
    }

    #[test]
    fn test_stack_push_pop() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.pop(), Some(2));
        assert_eq!(stack.pop(), Some(1));
    }

    #[test]
    fn test_stack_peek() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.peek(), Some(&2));
        assert_eq!(stack.peek(), Some(&2));
    }

    #[test]
    fn test_stack_peek_mut() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.peek_mut(), Some(&mut 2));
        assert_eq!(stack.peek_mut(), Some(&mut 2));
    }

    #[test]
    fn test_stack_peek_mut_pop() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.peek_mut(), Some(&mut 2));
        assert_eq!(stack.pop(), Some(2));
    }

    #[test]
    fn test_stack_peek_mut_pop_peek() {
        let mut stack: Stack<i32> = Stack::new();
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.peek_mut(), Some(&mut 2));
        assert_eq!(stack.pop(), Some(2));
        assert_eq!(stack.peek(), Some(&1));
    }
}