pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract VibeToken is ERC20Capped, ERC20Burnable {

    address payable public owner;
    uint256 public blockReward;

    // a ** b - a to the power of b
    constructor(uint256 cap, uint256 reward ) ERC20("VibeToken", "VCT" ) ERC20Capped(cap * (10 ** decimals())) {

        // set owner to be the user invoking the contract constructor
        owner = msg.sender;

        // give the creater 7000000 token + 18 decimal points - specifying 
        // the total supply in the smallest possible unit of the token
        _mint(msg.sender, 70000000 * (10 ** decimals() ));

        blockReward = reward * (10 ** decimals());
    }


    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward); 
        // block.coinbase - address of the miner (or the validating node in the case of
        //  Proof of Stake networks) of the current block.
    }


    // During a regular transfer that is not to the miner of the current block), a reward is minted for the miner. 
    function _beforeTokenTransfer( address from, address to, uint256 value) internal virtual override {
        if( from != address (0) && to != block.coinbase && block.coinbase != address(0)){
            _mintMinerReward();    
        }
        super._beforeTokenTransfer(from, to, value);
    }

    // let owner reset the block teward (in case if the tokens were distributed too much)
    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * ( 10 ** decimals());
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
}