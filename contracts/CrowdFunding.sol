//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract demo{
    function getStr1() public pure returns(string memory){
    bytes memory str1 = bytes("hello");
    bytes memory str2 = str1[0];
    string memory a = string(str2);
        return a;
    }

}