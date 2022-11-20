//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract number{
    uint  num2=456;
    //length
    function length() external pure returns(uint){
    uint  num1=123;
        uint8 numLen;
        while(num1!=0){
            num1=num1/10;
            numLen++;
        }
        return numLen; 
    }
    //compare
function compareNum(uint _num1, uint _num2) external pure returns(bool){
    return _num1==_num2;
}
    //reverse
function reverseNum(uint _num1, uint _num2) external pure returns(bool){
    return _num1==_num2;
}
    

}