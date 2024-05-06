//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.25;

contract twitter {
    mapping (address => string) public tweets; //declares a mapping named tweets.
    function createTweet(string memory _tweet) public { // defines a function named createTweet that takes a single argument of type string named _tweet.
        tweets[msg.sender] = _tweet; //assigns the value of the _tweet argument to the key msg.sender in the tweets mapping.
    }

    function getTweet(address _owner) view  public returns (string memory){
        return tweets[_owner] ; 

     }

}