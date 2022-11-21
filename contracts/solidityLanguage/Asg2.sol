//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Asg2{
    //1
    function concatenate(string calldata _str1, string calldata _str2) external pure returns(string memory){
        return string.concat(_str1,_str2);
    }
    //2
    function compareStr(string calldata _str1, string calldata _str2) external pure returns(bool){
        return keccak256(abi.encodePacked(_str1))==keccak256(abi.encodePacked(_str2)) ? true : false;
    }
    //3
    function contains(uint _num) external pure returns(bool){
        uint8[5] memory arr = [1,2,3,4,5];
        for(uint i=0; i<arr.length; i++){
            if(arr[i]==_num){
                return true;
            }
        }
        return false;
    }
    //4
    function largest(int[4] calldata _arr) external pure returns(int){
        int large = 0;
        for(uint i=0; i<_arr.length; i++){
            if(i==0||large < _arr[i]){
            large = _arr[i];
            }
        }
        return large;
    }
    //5
    function sortArray(int[5] memory _arr) external pure returns(int[5] memory){
        //using Bubble sort
        //[1,4,5,3,2]
        for(uint i =0; i<_arr.length-1; i++){
            for(uint j =0; j<_arr.length-1; j++){
                if(_arr[j]> _arr[j+1]){
                    (_arr[j], _arr[j+1]) = (_arr[j+1],_arr[j]);
                }
            }
        }
        return _arr;
    }
    //6
    function reverseArray(int[] memory _arr) external pure returns(int[] memory){
        int[] memory _reverseArr = new int[](_arr.length);
        for(uint i =0; i<_arr.length; i++){
            _reverseArr[i] = _arr[_arr.length - 1 -i];
        }
        return _reverseArr;
    }
    //7
    function insertArr(int _num, uint _index) external pure returns(int[] memory){
        int[] memory _arr = new int[](10);
        _arr[_index] = _num;
        return _arr;
    }
    //8
    function sumArr(int[] memory _arr) external pure returns(int){
        int res;
        for(uint i =0; i<_arr.length;i++){
            res = res + _arr[i];
        }
        return res;
    }
    //9
        struct student{
            string name;
            uint rollNumber;
            uint age;
        }
    function studentStruct() external pure returns(student memory){

        student memory std1 = student("yaser",29);
        return std1;
    }
    //10
    function studentStruct() external pure returns(student memory){

        student memory std1 = student("yaser",29);
        return std1;
    }
    //11
}