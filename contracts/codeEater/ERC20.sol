//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

interface ERC20Interface {

    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);

    function transfer(address to, uint tokenCount) external  returns(bool success);
    function allowance(address tokenOwner, address spender) view external returns(uint);
    //approve
    //transferFrom
    //transfer
    event Transfer(address indexed from, address indexed to, uint tokenCount);
    //approval

}

contract Block is ERC20Interface {
    string public name="Block";
    string public symbol="BLK";

    uint public decimal = 0;

    uint public override totalSupply;
    address public founder;
    mapping(address=> uint) balances;
    mapping(address=> mapping(address=> uint)) allowances; 

    constructor(){
        totalSupply=1000;
        founder=msg.sender;
        balances[founder]=totalSupply;
    }

    function balanceOf(address tokenOwner) external view override returns (uint ){
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokenCount) external  override returns(bool ){
        require(balances[msg.sender]>=tokenCount,"Insufficient token balance");
        balances[to] += tokenCount;
        balances[msg.sender] -= tokenCount;
        emit Transfer(msg.sender, to, tokenCount);
        return true;
    }

    function allowance(address tokenOwner, address spender) view external override returns(uint){
        return allowances[tokenOwner][spender];
    }

    function approve(address spender, uint tokenCount) expernal override returns(uint){
        require(balances[msg.sender]>=tokenCount,"Insufficient token balance");
        allowances[msg.sender][spender] = tokenCount;
        

    }


}