// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EducationIT is ERC20, Ownable {
    constructor() ERC20("EducationIT", "EDIT") Ownable(msg.sender) {
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

// sepolia = 0x521b521332E7aBaaA19A85EC93E5c3F57b3ac664