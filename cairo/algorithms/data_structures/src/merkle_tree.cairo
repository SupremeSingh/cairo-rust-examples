use array::SpanTrait;
use hash::LegacyHash;
use traits::Into;

#[derive(Drop)]
struct MerkleTree {}

trait MerkleTreeTrait {
    fn new() -> MerkleTree;
    fn compute_root(ref self: MerkleTree, current_node: felt252, proof: Span<felt252>) -> felt252;
    fn verify(ref self: MerkleTree, root: felt252, leaf: felt252, proof: Span<felt252>) -> bool;
}

impl MerkleTreeImpl of MerkleTreeTrait {

    fn new() -> MerkleTree {
        MerkleTree {}
    }

    fn compute_root(
        ref self: MerkleTree, mut current_node: felt252, mut proof: Span<felt252>
    ) -> felt252 {
        loop {
            match proof.pop_front() {
                Option::Some(proof_element) => {
                    if Into::<felt252, u256>::into(current_node) < (*proof_element).into() {
                        current_node = LegacyHash::hash(current_node, *proof_element);
                    } else {
                        current_node = LegacyHash::hash(*proof_element, current_node);
                    }
                },
                Option::None(()) => {
                    break current_node;
                },
            };
        }
    }

    fn verify(
        ref self: MerkleTree, root: felt252, leaf: felt252, mut proof: Span<felt252>
    ) -> bool {
        let computed_root = self.compute_root(leaf, proof);
        computed_root == root
    }
}