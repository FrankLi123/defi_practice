pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VibeToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("VibeToken", "VCT" ){

        _mint(msg.sender, initialSupply);
    }
    
}