pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract VibeToken is ERC20Capped, ERC20Burnable {

    address payable public owner;

    // a ** b - a to the power of b
    constructor(uint256 cap) ERC20("VibeToken", "VCT" ) ERC20Capped(cap * (10 ** decimals())) {

        // set owner to be the user invoking the contract constructor
        owner = msg.sender;

        // give the creater 7000000 token + 18 decimal points
        // number of decimal places the token uses
        _mint(msg.sender, 70000000 * (10 ** decimals() ));
    }
    
}