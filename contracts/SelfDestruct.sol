// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract selfDestructContract {
    string public message;
    receive () external payable{}
    fallback () external payable{}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function setMsg(string memory _str) public {
        message = _str;
    }

    function destroy() public {
        address payable addr = payable(address(msg.sender));
        selfdestruct(addr);
    }
}