// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SimpleMappingExample {

    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;

    function setMyMapping(uint index) public {
        myMapping[index] = true;
    }

    function setAddressMapping() public {
        myAddressMapping[msg.sender] = true;
    }

}