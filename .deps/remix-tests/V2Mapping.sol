// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract V2Mapping {

    mapping (address => uint) public balanceReceived;

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    function sendMoney() public  payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withDrawMoney(address payable toAddress , uint amount) public {

        require(balanceReceived[msg.sender] >= amount, "Not Enough funds");
        balanceReceived[msg.sender] -= amount;

        toAddress.transfer(amount);
    }

    function withDrawAllMoney(address payable  toAddress) public {
        uint balanceToSend = balanceReceived[msg.sender];

         // Transfer All the Contract Address funds to toAddress           
        //toAddress.transfer(address(this).balance);

        balanceReceived[msg.sender] = 0; // balanceReceived for the sender should be reset.    
        toAddress.transfer(balanceToSend);

    }
}