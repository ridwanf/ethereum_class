// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStringbytes32 {

    address ownerAddress;

    struct data {
        string name;
        string status;
        bool isValue;
    }

    constructor(){
        ownerAddress = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == ownerAddress, "Hanya address owner yang bisa menjalankan!");
        _;
    }

    mapping (bytes32 => data) public dataMapping;

    function storeBytes(bytes32 _bytes, string memory _name) private {
        dataMapping[_bytes].name = _name;
        dataMapping[_bytes].status = "Sudah terdaftar";
        dataMapping[_bytes].isValue = true;
    }

    function inputString(string memory _str) public onlyOwner {
        storeBytes(convertBytes(_str), _str);
    }

    function convertBytes(string memory _str) private pure returns (bytes32) {
        return sha256(bytes(_str));
    }

    function checkData(string memory _str) public view returns (bool) {
        return dataMapping[convertBytes(_str)].isValue;
    }

}