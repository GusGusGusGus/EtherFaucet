// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Owned.sol";

contract Mortal is Owned {
	// Contract destructor
	function destroy() public onlyOwner {
		selfdestruct(owner);
	}
}