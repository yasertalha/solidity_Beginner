//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Poly {
    function add(uint256 _a, uint256 _b) pure public returns (uint256) {
        return _a + _b;
    }

    function add(
        uint256 _a,
        uint256 _b,
        uint256 _c
    ) public pure returns (uint256) {
        return _a + _b + _c;
    }
}
