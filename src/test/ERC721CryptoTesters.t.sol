// SPDX-License-Identifier: CCO
pragma solidity ^0.8.0;

import 'ds-test/test.sol';
import 'forge-std/Vm.sol';
import '../ERC721CryptoTesters.sol';

contract ERC721CryptoTestersTest is DSTest {
    Vm vm = Vm(HEVM_ADDRESS);

    // users
    address testerOne = address(1);
    address testerTwo = address(2);

    function setUp() public {

        // traces readability enhancement
        vm.label(testerOne, 'Tester One');
        vm.label(testerTwo, 'Tester Two');
        vm.label(address(this), 'CryptoTestersNftTest Contract');
        ERC721CryptoTesters nft = new ERC721CryptoTesters("Cryptotesters", "Testers", bytes32(0), false, false);

    }

    function testExample() public {
    }
}
