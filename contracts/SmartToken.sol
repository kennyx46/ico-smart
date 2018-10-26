pragma solidity ^0.4.23;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract SmartToken is ERC20Mintable, Ownable {
    string public constant name = "SmartToken";
    string public constant symbol = "ST";
    uint8 public constant decimals = 18;
}