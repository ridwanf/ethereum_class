// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Kalkulator {
    int number1;
    int number2;

    function InputNumber1(int _number) public {
        number1 =_number;
    }

     function InputNumber2(int _number) public {
        number2 =_number;
    }

    function Add() public view returns (int) {
        return number1 + number2;
    }

    function Subtract() public view returns (int) {
        return number1 - number2;
    }
}