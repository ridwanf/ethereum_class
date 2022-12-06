// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable returns (bool) {
        bool result = _to.send(msg.value);
        return result;
    }

    function sendViaCall(address payable _to) public payable {
        (bool result, ) = _to.call{value: msg.value} ("");
        require(result, "Process Transfer Gagal");
    }
}