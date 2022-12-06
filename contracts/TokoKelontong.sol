// SPDX-License-Identifier: MIT
import "hardhat/console.sol";

pragma solidity >=0.7.0 <0.9.0;

contract TokoKelontong {
    struct Barang {
        string namaBarang;
        uint stokBarang;
        uint hargaBarang;
    }

    struct BarangBelanja{
        uint itemID;
        string namaBarang;
        uint hargaBarang;
        uint jumlahPembelian;
        bool status;
    }

    Barang[] public listEtalase;
    address public ownerAddress;
    address public senderAddress;

    constructor() {
        ownerAddress = msg.sender;
    }

    function tambahBarang(string memory _namaBarang, uint _stokBarang, uint _hargaBarang) public {
        require(msg.sender == ownerAddress, "only owner can add barang");
        require(_stokBarang > 0);
        Barang memory b = Barang(_namaBarang, _stokBarang, _hargaBarang);
        listEtalase.push(b);
    }

      function beliBarang(uint _barangId, uint _jumlahPembelian) public payable returns (BarangBelanja memory){
        bool _status;
        Barang memory b = listEtalase[_barangId];
        require(b.stokBarang > 0 && b.stokBarang > _jumlahPembelian);
        uint jumlahBelanja = _jumlahPembelian * b.hargaBarang;
        require (msg.value > jumlahBelanja);
        payable(ownerAddress).transfer(jumlahBelanja);
        listEtalase[_barangId].stokBarang = b.stokBarang - _jumlahPembelian;
        _status = true;

        BarangBelanja memory bb = BarangBelanja(_barangId, b.namaBarang, b.hargaBarang, _jumlahPembelian, _status);
        return bb;
    }

     function CheckSaldo() public view returns(uint) {
        return ownerAddress.balance;
    }
}
