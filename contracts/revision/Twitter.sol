//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract SocialMsgr {
    //DS for functionalities
    struct Tweet {
        uint256 id;
        address author;
        string content;
        address[] like;
        uint256 createdAt;
    }

    struct Message {
        uint256 id;
        address from;
        address to;
        bool msgViewed;
        string content;
        uint256 createdAt;
    }

    struct User {
        address author;
        address[] operator;
        address[] follow;
    }

    //tweets DS
    mapping(address => uint256[]) tweetOf;
    mapping(uint256 => Tweet) public tweet;
    //Message DS
    mapping(address => uint256[]) conversationOf;
    mapping(uint256 => Message) conversation;

    uint256 tweetId;
    uint256 msgId;

    // modifier isPosterAuth(address from) {
    // }
    function post(address _from, string calldata _content) external {
        address[] memory emptyAddressList;
        require(msg.sender == _from, "Not authorized user");
        tweetOf[_from].push(tweetId);
        tweet[tweetId] = Tweet({
            id: tweetId,
            author: _from,
            content: _content,
            like: emptyAddressList,
            createdAt: block.timestamp
        });
        tweetId++;
    }

    function like(uint256 id) external {
        //check sender already likes
        bool isAlreadyLiked;
        for (uint256 i = 0; i < tweet[id].like.length; i++) {
            if (tweet[id].like[i] == msg.sender) {
                isAlreadyLiked = true;
                delete tweet[id].like[i];
            }
        }
        if (!isAlreadyLiked) {
            tweet[id].like.push(msg.sender);
        }
    }

    function getLikes(uint256 id) external view returns (address[] memory) {
        return tweet[id].like;
    }

    //message
    function sendMsg(
        address _from,
        address _to,
        string calldata _content
    ) external {
        Message memory newMsg = Message({
            id: msgId,
            from: _from,
            to: _to,
            msgViewed: false,
            content: _content,
            createdAt: block.timestamp
        });
        conversation[msgId] = newMsg;
        conversationOf[_from].push(msgId);
        conversationOf[_to].push(msgId);
        msgId++;
    }

    function getMyMsg(address _from) external view returns (Message[] memory) {
        require(conversationOf[_from].length>0, "no conversation's to display");
        uint256[] memory ids = new uint256[](conversationOf[_from].length);
        ids = conversationOf[_from];
        require(ids.length > 0, "no msg to display");
        Message[] memory temp = new Message[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            temp[i] = conversation[ids[i]];
        }
        return temp;
    }
}
