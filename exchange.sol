// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface MintableERC20 is IERC20 {
    function mint(address to, uint256 amount) external;
}

contract Exchange is Ownable {

    IERC20 public usdt;
    MintableERC20 public edit;
    uint256 public price;

    event BUY(address who, uint256 amount);

    constructor(address _usdt, address _edit, uint256 _price) Ownable(msg.sender) {
        usdt = IERC20(_usdt);
        edit = MintableERC20(_edit);
        price = _price;
    }

    function buy(uint256 _amountUSDT) external {
        // approve
        usdt.transferFrom(msg.sender, address(this) , _amountUSDT);
        uint256 _amount;
        _amount = _amountUSDT * price;
        edit.mint(msg.sender, _amount);
        emit BUY(msg.sender, _amount);
    }

    function extractUSDT() external onlyOwner {
        usdt.transfer(msg.sender,usdt.balanceOf(address(this)));
    }

}

// Sepolia = 0x13A25cb53e3CCe03ab744D24fe629e7dbE04aD31