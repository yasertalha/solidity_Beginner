//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract palindrome {
    function find(uint256 input) external pure {
        //100
        uint256 reversed;
        uint256 remainder;
        uint256 original = input;
        while (input != 0) {
            remainder = input % 10; // get last value of a number
            reversed = reversed * 10 + remainder;

            input = input / 10; // remove last value of a number
        }
    }
}
