// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity ^0.8.13;

contract Owned {
	address payable owner;

	// Contract constructor: set owner
	constructor() {
		owner = payable(msg.sender);
	}

	// Access control modifier
	modifier onlyOwner {
	    require(msg.sender == owner,  "Only the contract owner can call this function");
	    _;
	}
}