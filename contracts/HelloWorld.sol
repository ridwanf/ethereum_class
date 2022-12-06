// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld {
    string private name = "Hello World";

    function GetHelloWorld() public view returns (string memory) {
        return name;
    }
}

contract NewContract {
     function GetHelloWorld(int val) public pure returns (int) {
         return val;
     }
}