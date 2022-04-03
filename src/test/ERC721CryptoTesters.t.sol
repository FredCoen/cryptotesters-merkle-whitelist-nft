// SPDX-License-Identifier: CCO
pragma solidity ^0.8.0;

import 'ds-test/test.sol';
import 'forge-std/Vm.sol';
import '../ERC721CryptoTesters.sol';

contract Receiver is IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 id,
        bytes calldata data
    ) external returns (bytes4) {
        return this.onERC721Received.selector;
    }
}

contract ERC721CryptoTestersTest is DSTest {
    Vm vm = Vm(HEVM_ADDRESS);

    // Users
    address testerOne = address(1);
    address testerTwo = address(2);

    // Contracts
    ERC721CryptoTesters nft;

    function setUp() public {
        // traces readability enhancement
        vm.label(testerOne, 'Tester One');
        vm.label(testerTwo, 'Tester Two');
        vm.label(address(this), 'CryptoTestersNftTest Contract');

        nft = new ERC721CryptoTesters('Cryptotesters', 'Testers', bytes32(0), false, false);
    }

    function testPreMintForTreasuryMultiSig() public {
        // Given:
        Receiver receiver = new Receiver();
        assertEq(nft.balanceOf(address(receiver)), 0);
        
        // When:
        nft.transferOwnership(address(receiver));
        vm.prank(address(receiver), address(receiver));
        nft.preMintForTreasury();

        // Then:
        for (uint256 id = 1; id < 151; id++) {
            assertEq(nft.ownerOf(id), address(receiver));
        }
        assertEq(nft.balanceOf(address(receiver)), 150);
    }

    function testPreMintForTreasuryEOA() public {
        // Given:
        assertEq(nft.balanceOf(testerOne), 0);

        // When:
        nft.transferOwnership(testerOne);
        vm.prank(testerOne, testerOne);
        nft.preMintForTreasury();

        // Then:
        for (uint256 id = 1; id < 151; id++) {
            assertEq(nft.ownerOf(id), testerOne);
        }
          assertEq(nft.balanceOf(testerOne), 150);
    }
}


