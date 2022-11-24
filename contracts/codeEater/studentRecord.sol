//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract stdRecrd{

    address[] teachers=[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4];
    struct Student{
        uint roll;
        string name;
        uint[3] marks;
    }
    error notValidTeacher(address[] teachersList, address received);
    modifier onlyTeacher {
        bool  isTeacher;
        for(uint i=0; i<teachers.length;i++){
            if(teachers[i]==msg.sender){
            isTeacher = true;
        }
    }
      if(isTeacher == false){
          revert notValidTeacher(teachers, msg.sender);
      }
      _;
   }
   mapping (uint=>Student) studentRecord;
    function addRecord(uint _roll, string calldata _name, uint[3] calldata _marks) onlyTeacher external{    
        studentRecord[_roll] = Student(_roll, _name,  _marks);
    }
    function getRecord(uint _roll) view external onlyTeacher returns( Student memory){    
        return studentRecord[_roll];
    }
    function deleteRecord(uint _roll)  external onlyTeacher returns(bool){    
        delete studentRecord[_roll];
        return studentRecord[_roll].roll == 0 ? true : false;
    }
}