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

        student memory std1 = student("yaser",1, 29);
        return std1;
    }
    //10
    student[10] public tenStudentsRecord;
    
    function updateTenStudentsRecord(string calldata _name, uint _roll, uint _age) external{
        tenStudentsRecord[_roll] = student(_name, _roll, _age);
    }
    //11
    //mapping(address => uint[3]) array , [0]=maths , [1]=english, [2]=history
    mapping(address => uint[3]) markReport;
    function updateMarks(string calldata subject, uint mark) external {
        if (keccak256(abi.encodePacked(subject))==keccak256(abi.encodePacked('maths')))     markReport[msg.sender][0] = mark;
        if (keccak256(abi.encodePacked(subject))==keccak256(abi.encodePacked('english')))   markReport[msg.sender][1] = mark;
        if (keccak256(abi.encodePacked(subject))==keccak256(abi.encodePacked('history')))   markReport[msg.sender][2] = mark;
    }
    function getMarks() external view returns(uint[3] memory){
        return markReport[msg.sender];
    }
    //12
    mapping (address => student) stdStruct;
    function stdSetter(string calldata _name, uint _roll, uint _age) external {
        stdStruct[msg.sender] = student(_name, _roll, _age);
    }
    function stdGetter() external view returns(student memory){
        return stdStruct[msg.sender];
    }
    //13
    mapping(address=> mapping(address=>bool)) private ownership;
    function createOwnershipData () external{
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = false;
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = false;
    }
    function transferOwnership () external{
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][msg.sender]=true;
    }
    function ownershipStatus () view external returns(bool){
       return ownership[msg.sender][msg.sender];
    }
    //14
    string[] names;
    function addName(string memory _name) external {
        names.push(_name);
    }
    function delName() external {
        names.pop();
    }
    function getName() view external returns(string[] memory){
        return names;
    }
    // 15
    enum HOUSE{SMALL, MEDIUM, LARGE}
    HOUSE house;
    function setHouseVal() external{
        house = HOUSE.MEDIUM;
    }

    function GetHouseVal() external view returns(string memory){
        if( house == HOUSE.SMALL){
            return "SMALL";
        }
        if( house == HOUSE.LARGE){
            return "LARGE";
        }
        else{
            return "MEDIUM";
        }
    }


}