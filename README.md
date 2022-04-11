## Merkle Tree Whitelisted Cryptotesters NFT

Simple NFT contract with treasury, whitelist and public mint.

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

### Deploy to Arbitrum

```bash
export PRIVATE_KEY = <your-private-key>
export RPC_URL_ARBITRUM = <your_rpc_url>
```

```bash
forge create --rpc-url $RPC_URL_ARBITRUM --private-key $PRIVATE_KEY src/ERC721CryptoTesters.sol:ERC721CryptoTesters --constructor-args <args>
```

### Verify deployed contract on Arbiscan

```bash
forge verify-contract --chain-id 421611 --num-of-optimizations 1000000 --constructor-args <abi-encoded-args> --compiler-version v0.8.0+commit.c7dfd78e <deployment-address> src/ERC721CryptoTesters.sol:ERC721CryptoTesters <arbiscan-apy-key>
```

Note: Use cast cli to get encoded constructor args

```bash
cast abi-encode "constructor(string,string,bytes32,bool,bool)" <args>
```

Check contract has been verified:

```bash
forge verify-check --chain-id 421611 <GUID> <arbiscan-apy-key>
```

## License

All code has been licensed under CC0, just like CryptoTesters themselves.
