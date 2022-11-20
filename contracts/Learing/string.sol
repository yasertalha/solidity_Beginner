//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract stringManipulation{
    //length
    function length(string calldata _str)  external pure returns(uint){
        return bytes(_str).length;
    }
    //concat
    function concatinate(string calldata _str1,string calldata _str2) external pure returns(string memory){
        return string.concat(_str1,_str2);
    }
    //reverse
    function reverse(string calldata _str) external pure returns(string memory){
        bytes memory _byt1 = bytes(_str);
        bytes memory _bytReversed = new bytes(_byt1.length);
        for(uint i=0; i<_byt1.length; i++){
            _bytReversed[_byt1.length-i-1] = _byt1[i];
        }
        return string(_bytReversed);
    }
    //compare
    function isSame(string calldata _str1,string calldata _str2) external pure returns(bool){
        return keccak256(abi.encodePacked(_str1))==keccak256(abi.encodePacked(_str2));
    }
}