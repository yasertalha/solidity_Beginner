//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Asg1{
    int public a = 1;
    int public b = 2;
    function cube(uint num) pure public returns(uint){
        return num*num*num;
    }
    function oddOrEven(int num) pure public returns(uint){
        if(num%2==0)  return 1;
        else return 0;
    }
    function avg(uint num1, uint num2, uint num3) public pure returns(uint){
        return ( num1+ num2+ num3)/3;
    }
    function expo(uint x, uint y) pure public returns(uint){
        return x**y;
    }
    function swap() public{
        // swap a and b
        (a, b) = (b, a);
    }
    function prime(int num) public pure returns(int){
        // return 1 if prime else 0
        for(int i = 2; i < num; i++){
            if(num % i == 0) {
                return 0;
            }
        }
        return 1;
    }
    function amstrong(string memory str12) public pure returns(string memory){
        // return true if amstrong else false
        // for(int i = 2; i < num; i++){
        //     if(num % i == 0) {
        //         return 0;
        //     }
        // }
        // return 1;
        bytes memory b1 = bytes(str12);
        string memory res = string(b1);
        res[0]='q';
        return res;
//how will i come to know am blockchain ready ?
    }

    function greater(int num1, int num2, int num3) public pure returns(int){
        int temp = num1>num2 ? num1 : num2 ;
        return temp>num3 ? temp : num3;
    }
    function factorial(uint num) public pure returns(uint){
        uint res=1;
        for(uint i = 1; i<=num; i++){
            res=res*i;
        }
        return res;
    }
}