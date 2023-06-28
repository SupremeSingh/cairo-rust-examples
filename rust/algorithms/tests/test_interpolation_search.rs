#[cfg(test)]
mod interpolation_search_test {
    use algorithms::search::interpolation_search::interpolation_search;

    #[test]
    fn test_interpolation_search_empty_array() {
        let collection: Vec<i32> = vec![];
        assert_eq!(Err(0), interpolation_search(&collection, &1));
    }

    #[test]
    fn test_interpolation_search_one_element() {
        let collection = vec![1];
        assert_eq!(Ok(0), interpolation_search(&collection, &1));
        assert_eq!(Err(0), interpolation_search(&collection, &2));
    }

    #[test]
    fn test_element_not_found() {
        let collection = vec![1, 2, 3, 4, 5];
        assert_eq!(Err(0), interpolation_search(&collection, &0));
        assert_eq!(Err(4), interpolation_search(&collection, &6));
    }
}