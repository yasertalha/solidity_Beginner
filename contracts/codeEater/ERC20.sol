//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract ERC20Iterface {

    //totalSupply
    function totalSupply() external view return (uint);
    //balanceOf
    //transfer
    //allowance
    //approve
    //transferFrom
    //transfer
    //approval

}

contract Block is ERC20Iterface {
    string public name="Block";
    string public symbol="BLK";

    uint public override totalsupply;
}