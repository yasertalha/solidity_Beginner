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
    //follower ds
    mapping(address => address[]) public followers;
    //Operators
    mapping(address=>mapping(address=>bool)) public Operators;

    uint nextId;

    function tweet(address _from, string calldata content)  internal{
        require(_from==msg.sender || Operators[_from][msg.sender]==true, "You are Autherized");
        tweets[nextId] = Tweet(nextId, _from, content, block.timestamp);
        tweetsOf[_from].push(nextId);
        nextId++;
    }

    uint nextMsgId;
    function message(address _from, address _to, string calldata _content)  internal{
        require(_from==msg.sender || Operators[_from][msg.sender]==true, "You are Autherized");
        conversation[_from].push(Message(nextMsgId, _from, _to, _content, block.timestamp));
        nextMsgId++;
    }

    //Owner tweets here
    function tweet(string calldata content) external{
        tweet(msg.sender, content);
    }

    //operator tweets here
    function tweetFrom(address _from, string calldata content) external{
        tweet(_from, content);
    }

    //Owner msg's here
    function message(address _to, string calldata _content)  internal{       
        message(msg.sender, _to, _content);
    }

    //operator msg's here
    function messageFrom(address _from, address _to, string calldata _content)  internal{       
        message(_from, _to, _content);
    }

    //follow
    function follow(address followed) external{
        followers[msg.sender].push(followed);
    }

    //allow Operator
    function allowOper(address Operator) external{
        Operators[msg.sender][Operator]=true;
    }

    //dis-allow Operator
    function disAllowOper(address Operator) external{
        Operators[msg.sender][Operator]=false;
    }

    //get Latest tweets - say last 5 tweets
    function getLatestTweets(uint count) external {
        Tweet[] memory tempArr = new Tweet[](count);

    }
}