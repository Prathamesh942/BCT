// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    // Structure to represent a student
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    // Array to store students
    Student[] public students;

    // Event to emit when a new student is added
    event StudentAdded(uint256 id, string name, uint256 age);

    // Function to add a new student
    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_id, _name, _age);
        students.push(newStudent);
        emit StudentAdded(_id, _name, _age);
    }

    // Function to get the total number of students
    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }

    // Fallback function to handle direct Ether transfers to the contract
    fallback() external payable {
        // This contract does not handle Ether transfers, just store it
    }

    // Function to check the balance of Ether sent to this contract
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
