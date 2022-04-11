const { MerkleTree } = require('merkletreejs')
const keccak256 = require('keccak256')
// Input whitelist adresses
const whiteList = ['address_one', 'address_two']

const leaves = whiteList.map(address => keccak256(address))
const tree = new MerkleTree(leaves, keccak256, {sortPairs:true})
const leaf = 'address_one'
const proof = tree.getHexProof(keccak256(leaf))
console.log("Merkle root:", tree.getHexRoot())
console.log("Merkle proof:", proof)
