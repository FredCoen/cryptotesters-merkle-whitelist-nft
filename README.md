#### Deploy to Optimism

```bash
export PRIVATE_KEY = <your-private-key>
export RPC_URL_OPTIMISM = <your_rpc_url>
```

```bash
forge create --rpc-url $RPC_URL_OPTIMISM --private-key $PRIVATE_KEY src/CryptoTestersNft.sol:CryptoTestersNft
```

#### Build locally

```bash
forge build
```
