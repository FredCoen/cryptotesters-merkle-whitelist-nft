pragma solidity ^0.8.0;
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/security/PullPayment.sol";

contract Controller is Ownable, PullPayment {
    bool public publicMint;
    bool public whitelistMint;
    string public baseURI;

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    function startWhitelistMint() public onlyOwner {
        whitelistMint = true;
    }

    function startPublicMint() public onlyOwner {
        publicMint = true;
    }

    /// @dev Overridden in order to make it an onlyOwner function
    function withdrawPayments(address payable payee) public override onlyOwner {
        super.withdrawPayments(payee);
    }
}
