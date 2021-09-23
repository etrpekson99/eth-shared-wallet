// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.5;

contract SharedWallet {
    address owner;
    
    constructor() {
        owner = msg.sender; // owner is address that deployed smart contract
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner { // only the owner can withdraw
        _to.transfer(_amount);
    }

    receive() external payable {

    }
}