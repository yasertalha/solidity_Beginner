//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract palindrome{

function find(uint input){//100
uint reversed;
uint remainder;
uint original;
    while(input!=0){
        remainder = input % 10;// get last value of a number
        reversed  = reversed * 10 + remainder;

        input/    = 10;// remove last value of a number
    }

}
}