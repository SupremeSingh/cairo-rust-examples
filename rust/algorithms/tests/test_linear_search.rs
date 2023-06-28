#[cfg(test)]
mod linear_search_test {
    use algorithms::search::linear_search::linear_search;

    #[test]
    fn test_empty_array() {
        let collection: [i32; 0] = [];
        assert_eq!(linear_search(&1, &collection), None);
    }

    #[test]
    fn test_one_element_array() {
        let collection: [i32; 1] = [1];
        assert_eq!(linear_search(&1, &collection), Some(0));
        assert_eq!(linear_search(&2, &collection), None);
    }

    #[test]
    fn test_string_vector() {
        let collection: Vec<&str> = vec!["a", "b", "c", "d", "e"];
        assert_eq!(linear_search(&"a", &collection), Some(0));
        assert_eq!(linear_search(&"b", &collection), Some(1));
        assert_eq!(linear_search(&"c", &collection), Some(2));
        assert_eq!(linear_search(&"d", &collection), Some(3));
        assert_eq!(linear_search(&"e", &collection), Some(4));
        assert_eq!(linear_search(&"f", &collection), None);
    }

    #[test]
    fn test_element_not_found() {
        let collection: [i32; 5] = [1, 2, 3, 4, 5];
        assert_eq!(linear_search(&6, &collection), None);
    }
}
