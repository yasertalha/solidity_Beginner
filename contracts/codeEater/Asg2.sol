//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Asg2 {
    //1
    function concatenate(string calldata _str1, string calldata _str2)
        external
        pure
        returns (string memory)
    {
        return string.concat(_str1, _str2);
    }

    //2
    function compareStr(string calldata _str1, string calldata _str2)
        external
        pure
        returns (bool)
    {
        return
            keccak256(abi.encodePacked(_str1)) ==
                keccak256(abi.encodePacked(_str2))
                ? true
                : false;
    }

    //3
    function contains(uint256 _num) external pure returns (bool) {
        uint8[5] memory arr = [1, 2, 3, 4, 5];
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == _num) {
                return true;
            }
        }
        return false;
    }

    //4
    function largest(int256[4] calldata _arr) external pure returns (int256) {
        int256 large = 0;
        for (uint256 i = 0; i < _arr.length; i++) {
            if (i == 0 || large < _arr[i]) {
                large = _arr[i];
            }
        }
        return large;
    }

    //5
    function sortArray(int256[5] memory _arr)
        external
        pure
        returns (int256[5] memory)
    {
        //using Bubble sort
        //[1,4,5,3,2]
        for (uint256 i = 0; i < _arr.length - 1; i++) {
            for (uint256 j = 0; j < _arr.length - 1; j++) {
                if (_arr[j] > _arr[j + 1]) {
                    (_arr[j], _arr[j + 1]) = (_arr[j + 1], _arr[j]);
                }
            }
        }
        return _arr;
    }

    //6
    function reverseArray(int256[] memory _arr)
        external
        pure
        returns (int256[] memory)
    {
        int256[] memory _reverseArr = new int256[](_arr.length);
        for (uint256 i = 0; i < _arr.length; i++) {
            _reverseArr[i] = _arr[_arr.length - 1 - i];
        }
        return _reverseArr;
    }

    //7
    function insertArr(int256 _num, uint256 _index)
        external
        pure
        returns (int256[] memory)
    {
        int256[] memory _arr = new int256[](10);
        _arr[_index] = _num;
        return _arr;
    }

    //8
    function sumArr(int256[] memory _arr) external pure returns (int256) {
        int256 res;
        for (uint256 i = 0; i < _arr.length; i++) {
            res = res + _arr[i];
        }
        return res;
    }

    //9
    struct student {
        string name;
        uint256 rollNumber;
        uint256 age;
    }

    function studentStruct() external pure returns (student memory) {
        student memory std1 = student("yaser", 1, 29);
        return std1;
    }

    //10
    student[10] public tenStudentsRecord;

    function setTenStudentsRecord(
        string calldata _name,
        uint256 _roll,
        uint256 _age
    ) external {
        tenStudentsRecord[_roll] = student(_name, _roll, _age);
    }

    function getTenStudentsRecord() external view returns (student[10] memory) {
        return tenStudentsRecord;
    }

    //11
    //mapping(address => uint[3]) array , [0]=maths , [1]=english, [2]=history
    mapping(address => uint256[3]) markReport;

    function updateMarks(string calldata subject, uint256 mark) external {
        if (
            keccak256(abi.encodePacked(subject)) ==
            keccak256(abi.encodePacked("maths"))
        ) markReport[msg.sender][0] = mark;
        if (
            keccak256(abi.encodePacked(subject)) ==
            keccak256(abi.encodePacked("english"))
        ) markReport[msg.sender][1] = mark;
        if (
            keccak256(abi.encodePacked(subject)) ==
            keccak256(abi.encodePacked("history"))
        ) markReport[msg.sender][2] = mark;
    }

    function getMarks() external view returns (uint256[3] memory) {
        return markReport[msg.sender];
    }

    //12
    mapping(address => student) stdStruct;

    function stdSetter(
        string calldata _name,
        uint256 _roll,
        uint256 _age
    ) external {
        stdStruct[msg.sender] = student(_name, _roll, _age);
    }

    function stdGetter() external view returns (student memory) {
        return stdStruct[msg.sender];
    }

    //13
    mapping(address => mapping(address => bool)) private ownership;

    function createOwnershipData() external {
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        ] = false;
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
        ] = false;
    }

    function transferOwnership() external {
        ownership[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][
            msg.sender
        ] = true;
    }

    function ownershipStatus() external view returns (bool) {
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

    function getName() external view returns (string[] memory) {
        return names;
    }

    //15
    enum HOUSE {
        SMALL,
        MEDIUM,
        LARGE
    }
    HOUSE house;

    function setHouseVal() external {
        house = HOUSE.MEDIUM;
    }

    function GetHouseVal() external view returns (string memory) {
        if (house == HOUSE.SMALL) {
            return "SMALL";
        }
        if (house == HOUSE.LARGE) {
            return "LARGE";
        } else {
            return "MEDIUM";
        }
    }
}
