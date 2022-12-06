// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract TransferAmount {

    function SendAmount (address _address) public payable {
        payable(_address).transfer(msg.value);
    }

    function CheckSaldo(address _address) public view returns(uint) {
        return _address.balance;
    }

}

contract transferToContract {
    receive() external payable {}
    function checkSaldo() public view returns (uint) {
        return address(this).balance;
    }
}
