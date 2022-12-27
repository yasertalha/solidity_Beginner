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
    function find(int _num, int[] memory _arr) external pure returns (bool) {
        bool isFound;
        for (uint i=0; i<_arr.length; i++){
            if(_arr[i]==_num){
                isFound = true;
            }
        }
        return isFound;
    }

    //4 Largest in array
    function largestInArr(uint[] memory _arr) pure external returns(uint){
        uint res;
        for(uint i =0; i<_arr.length;i++){
            
        }
    }


}