//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import "./polymorphism.sol";

abstract contract Book{
uint length;
uint breath;
uint height;
Poly obj = new Poly();

function setBook(uint _length, uint _breath, uint _height) public{
    length=_length;
    breath=_breath;
    height=_height;
}
function getBook() view public returns(uint,uint,uint){
    return (length, breath, height);
}

function add(int _a, int _b) public virtual  returns(int);

}

contract Child is Book{
    int aa=2;
    function  add(int _a) public override view returns(int){
        return(_a  + aa);
    }

}