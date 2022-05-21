// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity ^0.8.13;

import "./Mortal.sol";

// Our first contract is a faucet!
contract Faucet is Mortal {

    event Withdrawal(address indexed to, uint amount);
	event Deposit(address indexed from, uint amount);

    constructor() {
        owner = payable(msg.sender);
    }

    // Accept any incoming amount
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);
        require(address(this).balance >= withdraw_amount,
        "Insufficient balance in faucet for withdrawal request");
        // Send the amount to the address that requested it
        payable(msg.sender).transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    fallback () external payable {}

}