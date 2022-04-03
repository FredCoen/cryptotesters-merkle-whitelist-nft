// SPDX-License-Identifier: CCO
pragma solidity ^0.8.0;

import 'ds-test/test.sol';
import 'forge-std/Vm.sol';
import 'forge-std/console.sol';
import '../ERC721CryptoTesters.sol';

contract ControllerTest is DSTest {
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

    function testPublicMintSetter() public {
        bool publicMintPre = nft.publicMint();
        assert(!publicMintPre);
        nft.startPublicMint();
        bool publicMintPost = nft.publicMint();
        assert(publicMintPost);
    }

    function testWhitelistMint() public {
        bool whitelistMintPre = nft.whitelistMint();
        assert(!whitelistMintPre);
        nft.startWhitelistMint();
        bool whitelistMintPost = nft.whitelistMint();
        assert(whitelistMintPost);
    }

    function testBaseURISetter() public {
        string memory baseURIPre = nft.baseURI();
        assertEq(baseURIPre, '');
        nft.setBaseURI('uri');
        string memory baseURIPost = nft.baseURI();
    }

    function testWithdrawPayments() public {
        vm.deal(address(nft), 1 ether);
        assertEq(address(nft).balance, 1 ether);
        assertEq(testerOne.balance, 0);
        nft.withdrawPayments(payable(testerOne));
        assertEq(address(nft).balance, 0);
        assertEq(testerOne.balance, 1 ether);
    }

    function testFailWithdrawNotOwner() public {
        vm.deal(address(nft), 1 ether);
        assertEq(address(nft).balance, 1 ether);
        assertEq(testerOne.balance, 0);
        vm.prank(testerOne, testerOne);
        nft.withdrawPayments(payable(testerOne));
    }
}
