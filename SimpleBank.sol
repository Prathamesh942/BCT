// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to store balances for each account address
    mapping(address => uint256) private balances;

    // Event to emit when money is deposited
    event Deposit(address indexed account, uint256 amount);
    
    // Event to emit when money is withdrawn
    event Withdrawal(address indexed account, uint256 amount);

    // Function to deposit money into the bank
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw money from the bank
    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        // Deduct the balance and transfer Ether
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        
        emit Withdrawal(msg.sender, _amount);
    }

    // Function to show the balance of the caller
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
