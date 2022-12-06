// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract FunctionRequire  {

    bool public StatusStop;
    uint public count;

   function setStop(bool _stop) external {
      StatusStop = _stop;
   }

   function inc() external {
        require(StatusStop, "Tidak dapat diproses karena status stop");
        count += 1;
   }

   function dec() external {
        require(StatusStop, "Tidak dapat diproses karena status stop");
        count -= 1;
   }

}
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4