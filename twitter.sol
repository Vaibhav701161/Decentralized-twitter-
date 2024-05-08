
    //SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.25;

contract twitter {

    uint16 public  MAX_TWEET_LENGTH = 280;// declaring the maximum length of the tweet 'constant'.

        struct tweet{
             uint256 id;
             address author;
             string content;
             uint256 timestamp;
             uint256 likes;
        }

    mapping (address => tweet[]) public tweets; //declares a mapping named tweets.
     address public owner;

     event tweetCreated(uint256 id, address author, string content, uint256 timestamp);
     event tweetLiked( address liker , address tweetAuthor  , uint256 tweetId, uint256 newLikeCount);
     event tweetUnLiked( address unliker , address tweetAuthor  , uint256 tweetId, uint256 newLikeCount);

     constructor(){
      owner = msg.sender;
     }
     modifier onlyOwner(){
      require(msg.sender == owner,"you are not the owner");
      _;
     }




     function changeTweetLength(uint16 newTweetLength) public onlyOwner{
            MAX_TWEET_LENGTH  = newTweetLength ;
     }


    function createTweet(string memory _tweet) public {


      require(bytes(_tweet).length<=MAX_TWEET_LENGTH,"this tweet is too large bro!!");// limit the length of tweet using require


         tweet memory newTweet = tweet({
            id : tweets[msg.sender].length,
             author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,// did this since data is coming directly from the block.
            likes:0
         });


        tweets[msg.sender].push(newTweet); //assigns the value of the _tweet argument to the key msg.sender in the tweets mapping.
    
         emit tweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }
      
         

    function likeTweet(address author, uint256 id) external {
      require(tweets[author][id].id == id,"TWEET DOES NOT EXIST");//to confirm the the tweet really exists and someone is not randomly trying to break the contract.
         tweets[author][id].likes++;

         emit tweetLiked(msg.sender,author,id,tweets[author][id].likes);
    }

    function unLikeTweet(address author, uint256 id) external{
            require(tweets[author][id].id == id,"TWEET DOES NOT EXIST");
            require(tweets[author][id].likes > 0,"TWEET HAVE NO LIKES");// this functionality confirms that the tweet will have -ve likes.
            tweets[author][id].likes--;

             emit tweetUnLiked(msg.sender,author,id,tweets[author][id].likes);
    }

    function getTweet(address _owner,uint _i) view  public returns (tweet memory){
        return tweets[_owner][_i] ; // this will get me tweet at some index i.

     }
     function getAllTweets(address _owner) public view returns(tweet[] memory){
        return tweets [_owner]; // hadn't passed index here because we want all the tweets.
     } 


}
