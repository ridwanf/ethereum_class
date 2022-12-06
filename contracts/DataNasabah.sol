// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract DataNasabah {
    address public ownerAddress;

    struct Nasabah {
        string nama;
        string alamat;
        string pekerjaan;
        address rekAddress;
        uint blokTime; 
        uint blockNumber;

    }

    constructor () {
        ownerAddress = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == ownerAddress, "only owner can access");
        _;
    }

    mapping(address => Nasabah) rekeningAddress;
    address[] public arrAddress;

    function registerNasabah ( string memory nama, string memory alamat, string memory pekerjaan, address rekAddress) public onlyOwner {
        Nasabah memory n = Nasabah(nama, alamat, pekerjaan, rekAddress, block.timestamp, block.number);
        rekeningAddress[rekAddress] = n;
        arrAddress.push(rekAddress);
    }

    function getNasabah (address rekAddress) public view returns (Nasabah memory) {
        return rekeningAddress[rekAddress];
    }

    function deleteNasabah (address rekAddress) public {
        delete rekeningAddress[rekAddress];
        deleteElementByIndex(indexOf(rekAddress));
    }
    
    function findByName(string memory _name) public view returns(address rekAddress,string memory name, string memory alamat,string memory pekerjaan) {
        uint arrayLength = arrAddress.length;

        for(uint i=0; i<arrayLength; i++) {
            address add = arrAddress[i];
            Nasabah memory rek = rekeningAddress[add];
            if(compareStringsbyBytes(rek.nama, _name)) {
                return(rekeningAddress[add].rekAddress, rekeningAddress[add].nama, rekeningAddress[add].alamat, rekeningAddress[add].pekerjaan);
            }
        }
    }

    function compareStringsbyBytes(string memory s1, string memory s2) private pure returns(bool){
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }
    function deleteElementByIndex(uint _index) private {
        require(_index < arrAddress.length,"Index Out Of Bound");
        for(uint i = _index; i< arrAddress.length -1; i++) {
            arrAddress[i]=arrAddress[i+1];
        }
        arrAddress.pop();
    }
    function indexOf(address _address) private view returns (uint256) {
        for (uint256 i = 0; i < arrAddress.length; i++) {
            if (arrAddress[i] == _address) {
                return i;
            }
        }
        revert("Not Found");
    }
}

    //0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    //0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB