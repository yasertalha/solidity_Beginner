//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Poly {
    int256 balance = 100;

    function add(int256 _a, int256 _b) public pure returns (int256) {
        return _a + _b;
    }

    function add(int256 _a) public view returns (int256) {
        return _a + balance;
    }
}
