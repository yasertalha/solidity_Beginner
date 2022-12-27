//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Assg_1{

    //1 cube of input 
    function Cube(uint _num) public pure returns(uint){
        return _num**3;
    }

    //2 even return 1, odd return 0
    function evenOrOdd(uint _num) external pure returns(uint){
        return _num%2 == 0 ? 1 : 0;
    }

    //3 Average of 3 numbers
    function avgOf3(uint _num1,uint _num2,uint _num3) external pure returns(uint){
        return (_num1+_num2+_num3)/3;
    }

    //4 swap numbers
    function normal_swap(uint _num1,uint _num2)  external pure returns(uint, uint){
        uint256 _num = _num1;
        _num1 = _num2;
        _num2 = _num;
        return (_num1, _num2);
    }

    //5 power of input num
    function powerOfInputs(uint _num1,uint _num2)  external pure returns(uint){
        return _num1**_num2;
    }

    //6 advance swap
    function advance_swap(uint _num1,uint _num2)  external pure returns(uint, uint){
        (_num1,_num2) = (_num2,_num1);
        return (_num1, _num2);
    }

    //7 prime return 1, odd return 0
    function primeOrNot(int256 num )  external pure returns(int){
        // return 1 if prime else 0
        for (int256 i = 2; i < num; i++) {
            if (num % i == 0) {
                return 0;
            }
        }
        return 1;
    }

    //8 find input is amstrong , 371 => 3*3 + 7*3 + 1*3 = 371.
    function amstrong(uint256 _inp) public pure returns (uint256) {
        require(_inp!=0,"not valid input");
      //find input length
      uint256 temp = _inp;
      uint256 calculatedInput = 0;

      uint256 inpLength = 0;
      while(temp!=0){
        temp /= 10;
        inpLength++;
      }

      // re-initialize temp
      temp = _inp;

      //multiply each number in input with input length and add every multiplication res
      
        while (temp != 0) {
            uint256 lastDig = temp % 10; //get last number
            calculatedInput = calculatedInput + lastDig**inpLength;
            temp /= 10;
        }
      return calculatedInput == _inp ? 1 : 0;

    }

    //9 

}
