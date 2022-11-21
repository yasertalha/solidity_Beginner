//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Asg1{
    mapping(string=>uint[] ) holder;
    //1
    function cube(uint _num1) external pure returns(uint){
        return _num1**2;
    }
    //2
    function oddOrEven(int num) pure public returns(uint){
        if(num%2==0)  return 1;
        else return 0;
    }
    //3
    function avg(uint num1, uint num2, uint num3) public pure returns(uint){
        return ( num1+ num2+ num3)/3;
    }
    //5
    function expo(uint x, uint y) pure public returns(uint){
        return x**y;
    }
    //6
    function swap() pure public{
        // swap a and b
        int  a = 1;
        int  b = 2;
        
        (a, b) = (b, a);
    }
    //7
    function prime(int num) public pure returns(int){
        // return 1 if prime else 0
        for(int i = 2; i < num; i++){
            if(num % i == 0) {
                return 0;
            }
        }
        return 1;
    }
//8
    function amstrong(uint _inp) public pure returns(uint){
        //find length of input
        uint temp = _inp;
        uint _inpLength=0;
        uint calculatedInput=0;

        while(temp!=0){
            _inpLength++;
            temp/=10;
        }
        require(_inpLength != 0,"not a valid number");
        temp = _inp;//restore temp
        //multiple each digit in number with length
        while(temp!=0){
            uint lastDig = temp%10;//get last number
            calculatedInput= calculatedInput + lastDig**_inpLength;
            temp/=10;
        }
        return _inp == calculatedInput ? 1 : 0;

    }
//9
    function greater(int num1, int num2, int num3) public pure returns(int){
        int temp = num1>num2 ? num1 : num2 ;
        return temp>num3 ? temp : num3;
    }
//10
    function Palindrome(uint _inp) external pure returns(uint){
        uint temp = _inp;
        uint reversed =0;
        while(temp!=0){
            uint lasDigt = temp%10;
            reversed = reversed*10 + lasDigt;
            temp/=10;
        }
        return reversed == _inp ? 1 : 0;
    }    
    //11
    function reverseInt(uint _inp) external pure returns(uint){
        uint reversed;
        uint tmp = _inp;
        while(tmp!=0){
            uint lastDig = tmp%10;
            reversed = reversed *10 + lastDig;
            tmp/=10;
        }
        return reversed;
    }
    //12
    function sumOfDigits(uint _inp) external pure returns(uint){
        uint temp = _inp;
        uint _inpSum = 0 ;

        while(temp!=0){
            uint lastDig = temp%10;
            _inpSum = _inpSum + lastDig;
            temp/=10;
        }
        return _inpSum;

    }
    //13
    function factorial(uint num) public pure returns(uint){
        uint temp = num;
        uint res=1;
        while(temp!=0){
            uint lastDig = temp%10;
            res = res * lastDig;
            temp/=10;
        }
        return res;
    }
    //14
    function fibonnical(uint num) external {
        require(num!=0,"not A valid number");
        uint tmp = num;
        // uint numLength;
        
        while(tmp!=0){
            uint lastDig = tmp%10;
            holder["numArr"].push(lastDig);
            tmp/=10;
        }

    }
    function fibonnicalResult() external view returns(uint){

        for (uint i=0; i<holder["numArr"].length-2; i++){
            if(holder["numArr"][i]!=holder["numArr"][i+1]+holder["numArr"][i+2]){
                return 0;
            }
        }

        return 1;
    }
    //15
    function multiple_with_no_Op(int x,int y) public pure returns(int){
        //recertion performed
        if (x==0||y==0) return 0;
        if (y>0) return x + multiple_with_no_Op(x,y-1);
        if (y<0) return -( x + multiple_with_no_Op(x,-y) );
        //1+(1+(0))=2
    }
}