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
        uint res = _arr[0];
        for(uint i =1; i<_arr.length;i++){
            if(_arr[i] > _arr[i-1]){
                res = _arr[i];
            }
        }
        return res;
    }

    //9 struct
    struct Student{
        string name;
        int roll;
        int age;
    }

    function newStudent(string memory _name, int roll, int age) pure external returns(Student memory){
        Student memory student1 = Student(_name, roll, age);
        return student1;
    }

    //10 - store 10 strudent structs
    mapping(string => Student[10]) public store10;
    function str10Std(string memory _name, int roll, int age, uint index) external {
        store10["students"][index] = Student(_name, roll, age);
    }

    function get10Std() external view returns(Student[10] memory){
        return store10["students"];//
    }

    //11 marks array (address => uint[])
    mapping(address=>uint[3]) marks;
    function setMark(uint Math, uint English, uint History) external {
        marks[msg.sender] = [Math, English, History];
    }
    function getMark() view external returns(uint[3] memory){
        return marks[msg.sender];
    }

    //13 
    mapping(address=>mapping(address=> bool)) public ownership;
    address[] substituteAdresses = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2];
        
    function resetOwnership() external {
        for(uint i=0; i<substituteAdresses.length;i++){
        ownership[msg.sender][
            substituteAdresses[i]
        ] = substituteAdresses[i]== msg.sender ? true:false;

        }
    }

    function transferownership(address newAdr)  external{
        substituteAdresses.push(newAdr);
        for(uint i=0; i<substituteAdresses.length;i++){
        ownership[msg.sender][
            substituteAdresses[i]
        ] = substituteAdresses[i]== newAdr ? true:false;

        }
    }

    function getCurntOwner() view external returns(address){
        address curntOwner;
        for(uint i=0; i<substituteAdresses.length;i++){
        if(ownership[msg.sender][
            substituteAdresses[i]
        ] ==true){
            curntOwner = substituteAdresses[i];
        }

        }
        return curntOwner;
    }

    //14 dynamic array  usage
    string[] public _strArr;
    function pushStrArr() external {
        //push
        _strArr.push("apple");

        //return entire arr
    }
    function popStrArr() external {
        //pop
        _strArr.pop();

        //return entire arr
    }

    //15 ENUM
    enum HOUSE {SMALL, MEDIUM, LARGE}
    HOUSE public houseSize;

    function setHouseSize(HOUSE val) external{
        houseSize = val;
    }

    function myHouse() view external returns(HOUSE){
        
        if (houseSize == HOUSE.SMALL) {
            return HOUSE.SMALL;
        }
        if (houseSize == HOUSE.LARGE) {
            return HOUSE.LARGE;
        } else {
            return HOUSE.LARGE;
        }
    }


}