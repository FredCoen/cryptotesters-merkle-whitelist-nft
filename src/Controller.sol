pragma solidity ^0.8.0;
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Controller is Ownable {

    /*//////////////////////////////////////////////////////////////
                                STORAGE
    //////////////////////////////////////////////////////////////*/

    bool public publicMint;
    bool public whitelistMint;
    string public baseURI;

    /*//////////////////////////////////////////////////////////////
                                GOVERNANCE LOGIC
    //////////////////////////////////////////////////////////////*/

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    function startWhitelistMint() public onlyOwner {
        whitelistMint = true;
    }

    function startPublicMint() public onlyOwner {
        publicMint = true;
    }

    function withdrawPayments(address payable payee) external onlyOwner {
        uint256 balance = address(this).balance;
        (bool transferTx, ) = payee.call{value: balance}("");
        require(transferTx);
    }

}
