//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract arrays{
    struct User{
        string name;
        uint age;
    }
    function UserUp() external pure returns(User[4] memory){
        string[4] memory names = ['a','b','c','d'];
        uint8[4] memory ages = [1,2,3,4];
        User[4] memory users;
        for(uint i=0; i<names.length;i++){
            users[i]=User(names[i],ages[i]);
        }
        return users;
    }
}