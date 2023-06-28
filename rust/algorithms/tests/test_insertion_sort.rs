#[cfg(test)]
mod insertion_sort_test {
    use algorithms::sort::insertion_sort::insertion_sort;

    #[test]
    fn test_insertion_sort_empty_vector() {
        let mut collection: Vec<i32> = vec![];
        insertion_sort(&mut collection);
        assert_eq!(collection, vec![]);
    }

    #[test]
    fn test_insertion_sort_one_element() {
        let mut collection = vec![1];
        insertion_sort(&mut collection);
        assert_eq!(collection, vec![1]);
    }

    #[test]
    fn test_character_vector() {
        let mut collection = vec!['c', 'a', 'd', 'b'];
        insertion_sort(&mut collection);
        assert_eq!(collection, vec!['a', 'b', 'c', 'd']);
    }
}
