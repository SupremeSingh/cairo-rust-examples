#[cfg(test)]
mod binary_search_test {
    use algorithms::search::binary_search::binary_search;

    #[test]
    fn test_binary_search_empty_array() {
        let collection: Vec<i32> = vec![];
        assert_eq!(Err("Empty array"), binary_search(&1, &collection));
    }

    #[test]
    fn test_binary_search_one_element() {
        let collection = vec![1];
        assert_eq!(Ok(0), binary_search(&1, &collection));
        assert_eq!(Err("Element not found"), binary_search(&2, &collection));
    }

    #[test]
    fn test_binary_search_two_elements() {
        let collection = vec![1, 2];
        assert_eq!(Ok(0), binary_search(&1, &collection));
        assert_eq!(Ok(1), binary_search(&2, &collection));
        assert_eq!(Err("Element not found"), binary_search(&3, &collection));
    }

    #[test]
    fn test_binary_search_string_vector() {
        let collection = vec!["a", "b", "c", "d", "e"];
        assert_eq!(Ok(0), binary_search(&"a", &collection));
        assert_eq!(Ok(1), binary_search(&"b", &collection));
        assert_eq!(Ok(2), binary_search(&"c", &collection));
        assert_eq!(Ok(3), binary_search(&"d", &collection));
        assert_eq!(Ok(4), binary_search(&"e", &collection));
        assert_eq!(Err("Element not found"), binary_search(&"f", &collection));
    }
}
