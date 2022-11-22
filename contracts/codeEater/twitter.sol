//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract twitter{

    struct Tweet {
        uint id;
        address author;
        string content;
        uint createdAt;
    }

    struct Message {
        uint id;
        address _from;
        address _to;
        string content;
        uint createdAt;
    }

    //tweet ds
    mapping(uint => Tweet) public tweets;
    mapping(address => uint[]) tweetsOf;
    //message ds
    mapping(address => Message[]) public conversation;

    uint nextId;

    function tweet(address _from, string calldata content) external {
        require(_from==msg.sender,"You are Autherized");
        tweets[nextId] = Tweet(nextId, _from, content, block.timestamp);
        tweetsOf[_from].push(nextId);
        nextId++;
    }

    uint nextMsgId;
    function message(address _from, address _to, string calldata _content) external {
        require(_from==msg.sender,"You are Autherized");
        conversation[_from].push(Message(nextMsgId, _from, _to, _content, block.timestamp));
        nextMsgId++;
    }
}