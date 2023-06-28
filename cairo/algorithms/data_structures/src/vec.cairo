use core::traits::TryInto;
use core::dict::Felt252DictEntryTrait;
use dict::Felt252DictTrait;
use option::OptionTrait;
use traits::{Index, Into};

struct Vec<T> {
    items: Felt252Dict<T>,
    len: usize,
}

impl DestructVec<
    T, impl TDrop: Drop<T>, impl TFelt252DictValue: Felt252DictValue<T>, impl TClone: Clone<T>
> of Destruct<Vec<T>> {
    fn destruct(self: Vec<T>) nopanic {
        self.items.squash();
    }
}

trait VecTrait<T> {
    fn new() -> Vec<T>;
    fn get(ref self: Vec<T>, index: usize) -> Option<T>;
    fn at(ref self: Vec<T>, index: usize) -> T;
    fn push(ref self: Vec<T>, value: T) -> ();
    fn set(ref self: Vec<T>, index: usize, value: T);
    fn len(self: @Vec<T>) -> usize;
}

impl VecImpl<
    T, impl TDrop: Drop<T>, impl TCopy: Copy<T>, impl TFelt252DictValue: Felt252DictValue<T>
> of VecTrait<T> {

    fn new() -> Vec<T> {
        let items = Felt252DictTrait::<T>::new();
        Vec { items, len: 0 }
    }

    fn get(ref self: Vec<T>, index: usize) -> Option<T> {
        if index < self.len() {
            let item = self.items.get(index.into());
            Option::Some(item)
        } else {
            Option::None(())
        }
    }

    fn at(ref self: Vec<T>, index: usize) -> T {
        if index < self.len() {
            let item = self.items.get(index.into());
            item
        } else {
            panic_with_felt252('Index out of bounds')
        }
    }

    fn push(ref self: Vec<T>, value: T) -> () {
        self.items.insert(self.len.into(), value);
        self.len = integer::u32_wrapping_add(self.len, 1_usize);
    }

    fn set(ref self: Vec<T>, index: usize, value: T) {
        if index < self.len() {
            self.items.insert(index.into(), value);
        } else {
            panic_with_felt252('Index out of bounds')
        }
    }

    fn len(self: @Vec<T>) -> usize {
        *(self.len)
    }
}

impl VecIndex<T, impl VecTraitImpl: VecTrait<T>> of Index<Vec<T>, usize, T> {
    #[inline(always)]
    fn index(ref self: Vec<T>, index: usize) -> T {
        self.at(index)
    }
}