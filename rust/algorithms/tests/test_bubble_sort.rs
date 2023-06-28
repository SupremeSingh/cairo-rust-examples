#[cfg(test)]
mod binary_search_test {
    use algorithms::sort::bubble_sort::bubble_sort;

    #[test]
    fn test_bubble_sort_empty_array() {
        let mut collection: Vec<i32> = vec![];
        bubble_sort(&mut collection);
        assert_eq!(collection, vec![]);
    }

    #[test]
    fn test_bubble_sort_one_element() {
        let mut collection = vec![1];
        bubble_sort(&mut collection);
        assert_eq!(collection, vec![1]);
    }

    #[test]
    fn test_bubble_sort_large_array() {
        let mut collection = vec![9, 8, 7, 6, 5, 4, 3, 2, 1];
        bubble_sort(&mut collection);
        assert_eq!(collection, vec![1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }

    #[test]
    fn test_bubble_sort_char_array() {
        let mut collection = vec!['c', 'b', 'a'];
        bubble_sort(&mut collection);
        assert_eq!(collection, vec!['a', 'b', 'c']);
    }
}