pragma solidity ^0.8.17;

contract VibeToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("VibeToken", "VCT" ){

        _mint(msg.sender, initialSupply);
    }
    
}