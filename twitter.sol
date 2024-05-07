//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.25;

contract twitter {

        struct tweet{
             address author;
             string content;
             uint256 timestamp;
             uint256 likes;
        }

    mapping (address => tweet[]) public tweets; //declares a mapping named tweets.
    function createTweet(string memory _tweet) public {
         tweet memory newTweet = tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,// did this since data is coming directly from the block.
            likes:0
         });


        tweets[msg.sender].push(newTweet); //assigns the value of the _tweet argument to the key msg.sender in the tweets mapping.
    }

    function getTweet(address _owner,uint _i) view  public returns (tweet memory){
        return tweets[_owner][_i] ; // this will get me tweet at some index i.

     }
     function getAllTweets(address _owner) public view returns(tweet[] memory){
        return tweets [_owner]; // hadn't passed index here because we want all the tweets.
     } 


}
