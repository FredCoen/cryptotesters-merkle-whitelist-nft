## Merkle Tree Whitelisted Cryptotesters NFT

Simple NFT contract with treasury, whitelist and public mint for the CryptoTesters community.

### Requirements

Install Foundry framework by following the instructions oullined [here](https://book.getfoundry.sh/getting-started/installation.html).

### Build

```bash
forge build
```

### Run tests

```bash
forge test
```

Test run with traces:

```bash
forge test -vvvvv
```

Run individual test:

```bash
forge test --match-test <test-name>
```

### Deploy to Optimism

```bash
export PRIVATE_KEY = <your-private-key>
export RPC_URL_OPTIMISM = <your_rpc_url>
```

```bash
forge create --rpc-url $RPC_URL_OPTIMISM --private-key $PRIVATE_KEY src/ERC721CryptoTesters.sol:ERC721CryptoTesters --constructor-args <args>
```

### Verify deployed contract on Arbiscan

```bash
forge verify-contract --chain-id 69 --num-of-optimizations 200 --constructor-args <abi-encoded-args> --compiler-version v0.8.13+commit.abaa5c0e <contract-address> src/ERC721CryptoTesters.sol:ERC721CryptoTester <optmistic-etherscan-key>
```

Note: Use cast cli to get encoded constructor args

```bash
cast abi-encode "constructor(string,string,bytes32,bool,bool)" <args>
```

Check contract has been verified:

```bash
forge verify-check --chain-id 69 <GUID> <arbiscan-apy-key>
```

## License

All code has been licensed under CC0, just like the CryptoTesters themselves.
