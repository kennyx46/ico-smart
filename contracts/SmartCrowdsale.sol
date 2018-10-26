pragma solidity ^0.4.23;

// Imports
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract SmartCrowdsale is CappedCrowdsale, MintedCrowdsale {
    constructor(
        uint256 _rate,
        address _wallet,
        uint256 _cap,
        ERC20Mintable _token,
        uint256 _goal
    )
        public
        Crowdsale(_rate, _wallet, _token)
        CappedCrowdsale(_cap)
    {
        require(_goal <= _cap);
    }
}
