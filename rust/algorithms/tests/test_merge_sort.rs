#[cfg(test)]
mod merge_sort_test {
    use algorithms::sort::merge_sort::merge_sort;

    #[test]
    fn test_merge_sort_empty_vector() {
        let collection: Vec<i32> = vec![];
        assert_eq!(merge_sort(&collection), vec![]);
    }

    #[test]
    fn test_merge_sort_one_element() {
        let collection = vec![1];
        assert_eq!(merge_sort(&collection), vec![1]);
    }

    #[test]
    fn test_character_vector() {
        let collection = vec!['c', 'a', 'd', 'b'];
        assert_eq!(merge_sort(&collection), vec!['a', 'b', 'c', 'd']);
    }
}
