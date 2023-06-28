#[cfg(test)]
mod exponential_search_test {

    use algorithms::search::exponential_search::exponential_search;

    #[test]
    fn test_exponential_search() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8];
        let target = 5;
        let result = exponential_search(&target, &arr);
        assert_eq!(result, Ok(4));
    }

    #[test]
    fn test_exponential_search_empty() {
        let arr = [];
        let target = 5;
        let result = exponential_search(&target, &arr);
        assert_eq!(result, Err(0));
    }
}