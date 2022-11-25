//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Asg1 {
    mapping(string => uint256[]) holder;

    //1
    function cube(uint256 _num1) external pure returns (uint256) {
        return _num1**2;
    }

    //2
    function oddOrEven(int256 num) public pure returns (uint256) {
        if (num % 2 == 0) return 1;
        else return 0;
    }

    //3
    function avg(
        uint256 num1,
        uint256 num2,
        uint256 num3
    ) public pure returns (uint256) {
        return (num1 + num2 + num3) / 3;
    }

    //5
    function expo(uint256 x, uint256 y) public pure returns (uint256) {
        return x**y;
    }

    //6
    function swap() public pure {
        // swap a and b
        int256 a = 1;
        int256 b = 2;

        (a, b) = (b, a);
    }

    //7
    function prime(int256 num) public pure returns (int256) {
        // return 1 if prime else 0
        for (int256 i = 2; i < num; i++) {
            if (num % i == 0) {
                return 0;
            }
        }
        return 1;
    }

    //8
    function amstrong(uint256 _inp) public pure returns (uint256) {
        //find length of input
        uint256 temp = _inp;
        uint256 _inpLength = 0;
        uint256 calculatedInput = 0;

        while (temp != 0) {
            _inpLength++;
            temp /= 10;
        }
        require(_inpLength != 0, "not a valid number");
        temp = _inp; //restore temp
        //multiple each digit in number with length
        while (temp != 0) {
            uint256 lastDig = temp % 10; //get last number
            calculatedInput = calculatedInput + lastDig**_inpLength;
            temp /= 10;
        }
        return _inp == calculatedInput ? 1 : 0;
    }

    //9
    function greater(
        int256 num1,
        int256 num2,
        int256 num3
    ) public pure returns (int256) {
        int256 temp = num1 > num2 ? num1 : num2;
        return temp > num3 ? temp : num3;
    }

    //10
    function Palindrome(uint256 _inp) external pure returns (uint256) {
        uint256 temp = _inp;
        uint256 reversed = 0;
        while (temp != 0) {
            uint256 lasDigt = temp % 10;
            reversed = reversed * 10 + lasDigt;
            temp /= 10;
        }
        return reversed == _inp ? 1 : 0;
    }

    //11
    function reverseInt(uint256 _inp) external pure returns (uint256) {
        uint256 reversed;
        uint256 tmp = _inp;
        while (tmp != 0) {
            uint256 lastDig = tmp % 10;
            reversed = reversed * 10 + lastDig;
            tmp /= 10;
        }
        return reversed;
    }

    //12
    function sumOfDigits(uint256 _inp) external pure returns (uint256) {
        uint256 temp = _inp;
        uint256 _inpSum = 0;

        while (temp != 0) {
            uint256 lastDig = temp % 10;
            _inpSum = _inpSum + lastDig;
            temp /= 10;
        }
        return _inpSum;
    }

    //13
    function factorial(uint256 num) public pure returns (uint256) {
        uint256 temp = num;
        uint256 res = 1;
        while (temp != 0) {
            uint256 lastDig = temp % 10;
            res = res * lastDig;
            temp /= 10;
        }
        return res;
    }

    //14
    function fibonnical(uint256 num) external {
        require(num != 0, "not A valid number");
        uint256 tmp = num;
        // uint numLength;

        while (tmp != 0) {
            uint256 lastDig = tmp % 10;
            holder["numArr"].push(lastDig);
            tmp /= 10;
        }
    }

    function fibonnicalResult() external view returns (uint256) {
        //112358 is a fiboniccal order
        for (uint256 i = 0; i < holder["numArr"].length - 2; i++) {
            if (
                holder["numArr"][i] !=
                holder["numArr"][i + 1] + holder["numArr"][i + 2]
            ) {
                return 0;
            }
        }

        return 1;
    }
}
