//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Assign_2{

    //1 concat 2 strings
    function concat2Strings(string calldata _str1, string calldata _str2) pure external returns(string memory){
        return string.concat(_str1,_str2);
    }

    //2 compare 2 strings
    function compare2Strings(string calldata _str1, string calldata _str2) pure external returns(bool){
        return keccak256(abi.encodePacked(_str1)) == keccak256(abi.encodePacked(_str2));
    }

    //3 find int in array
    function find(uint256 _num) external pure returns (bool) {
        uint8[5] memory arr = [1, 2, 3, 4, 5];
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == _num) {
                return true;
            }
        }
        return false;
    }


}