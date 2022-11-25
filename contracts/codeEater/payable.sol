//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract transfer{

    event etherTransfer(address receiver, uint balance);
    function sendEther(address _adrs) external payable{
        payable(_adrs).transfer(msg.value);
        emit etherTransfer(_adrs, msg.value);
    }

}