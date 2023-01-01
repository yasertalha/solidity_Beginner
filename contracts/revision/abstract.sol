//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

interface scholarship {
    function getScholarship(
        int128 marksPercentage,
        bool isVillage,
        bool isPoor
    ) external returns (int128);
}

abstract contract AbstractStd {
    struct Student {
        string name;
        uint256 roll;
        uint256 age;
    }

    mapping(uint256 => Student) students;

    function setStd(
        string memory name,
        uint256 roll,
        uint256 age
    ) external virtual;

    function getStd(uint256 roll) external virtual returns (Student memory);
}

contract yaser is AbstractStd, scholarship {
    function setStd(
        string memory name,
        uint256 roll,
        uint256 age
    ) external override {
        students[roll] = Student({name: name, roll: roll, age: age});
    }

    function getStd(uint256 roll)
        external
        view
        override
        returns (Student memory)
    {
        return students[roll];
    }

    function getScholarship(
        int128 marksPercentage,
        bool isVillage,
        bool isPoor
    ) external pure override returns (int128) {
        int128 percent = marksPercentage;
        if (isVillage && isPoor) {
            percent += 100;
        } else if (isVillage || isPoor) {
            percent += 50;
        } else {
            percent += 20;
        }

        percent /= 2;

        return percent;
    }
}
